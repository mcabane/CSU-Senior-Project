class Task < ApplicationRecord
  RECURRENCE_OPTIONS = %w[monthly six_months yearly custom]
  URGENCY_OPTIONS = %w[low medium high]
  DEADLINE_TYPES = %w[flexible concrete]

  validates :title, length: {maximum: 25}
  validates :description, length: {maximum: 255}
  validates :custom_category, length: { maximum: 25 }, allow_blank: true
  validates :recurrence, inclusion: { in: RECURRENCE_OPTIONS }
  validates :urgency, inclusion: { in: URGENCY_OPTIONS }
  validates :deadline_type, inclusion: { in: DEADLINE_TYPES }
  
  # Virtual attributes, so not to be stored in DB
  attr_accessor :custom_category, :custom_recurrence_number, :custom_recurrence_unit

  belongs_to :user, optional: true

  after_save :set_completed_at_timestamp


  def recur_if_due
    # Returns early if not completed and there is no recurrence
    return unless completed? && recurrence.present?

    # Returns early if not yet a month from deadline
    return unless deadline_date <= Date.today - 1.month
    
    

    base_date = completed_at 
    
    self.deadline_date = case recurrence
      when 'monthly' then base_date + 1.month
      when 'yearly' then base_date + 1.year
      when 'six_months' then base_date + 6.months
      when 'custom' 
        if custom_recurrence_number.present? && custom_recurrence_unit.present?
          base_date + custom_recurrence_number.to_i.send(custom_recurrence_unit)
        else 
          base_date
        end
      else base_date
    end

    # With new deadline_date, the completion status is reset
    self.completed = false

    # Raises error if there are validation errors
    save!
  end

  def deadline_countdown
    return nil unless deadline_date
    (deadline_date.to_date - Date.today).to_i.abs
  end

   def set_completed_at_timestamp
    if saved_change_to_completed? && completed?
      self.completed_at ||= Time.current
    end
  end

  
end
