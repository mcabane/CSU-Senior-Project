class Task < ApplicationRecord
  RECURRENCE_OPTIONS = %w[weekdays weekly monthly six_months yearly custom]
  URGENCY_OPTIONS = %w[low medium high]
  DEADLINE_TYPES = %w[flexible concrete]
  RECURRENCE_TYPES = %w[completion_date frequency_date]
  DEFAULT_CATEGORIES = [
    'Appliance Maintenance',
    'Car Maintenance',
    'Documents / Licenses',
    'Work',
    'Meetings',
    'Misc.'
  ]

  before_validation :replace_custom_category

  def replace_custom_category
    if category == "Custom" && custom_category.present?
      self.category = custom_category
    end
  end

  validates :title, presence: true, length: {minimum: 1, maximum: 25}
  validates :description, length: {maximum: 255}
  validates :deadline_type, inclusion: { in: DEADLINE_TYPES }
  validates :recurrence_type, inclusion: {in: RECURRENCE_TYPES}
  validates :recurrence, inclusion: { in: RECURRENCE_OPTIONS }
  validate :validate_custom_recurrence
  validates :custom_category, length: { maximum: 25 }, allow_blank: true
  validates :urgency, inclusion: { in: URGENCY_OPTIONS }
  validate :weekday_required_if_weekdays

  def weekday_required_if_weekdays
    if recurrence == "weekdays" && weekday_recurrence.blank?
      errors.add(:weekday_recurrence, "Must select at least one weekday")
    end
  end

  def validate_custom_recurrence
    return unless recurrence == "custom"

    if custom_recurrence_unit.blank?
      errors.add(:custom_recurrence_unit, "must be selected when using custom recurrence.")
    end

    if custom_recurrence_number.blank?
      errors.add(:custom_recurrence_number,"must be provided when using custom recurrence for duration interval.")
    elsif custom_recurrence_number.to_i < 1
      errors.add(:custom_recurrence_number, " must be at least 1.")
    end

  end

  # Virtual attributes, so not to be stored in DB
  attr_accessor :custom_category

  belongs_to :user, optional: true

  after_save :set_completed_at_timestamp

  def recurrence_base_date
    case recurrence_type
      when "completion_date"
        completed_at.to_date
      when "frequency_date"
        deadline_date.to_date
    else
      completed_at.to_date
    end
  end

  def recur_if_due
    # Returns early if not completed and there is no recurrence
    return unless completed? && recurrence.present?

    # Returns early if not yet a month from deadline
    return unless deadline_date <= Date.today - recurrence_threshold
  
    base_date = recurrence_base_date
    
    self.deadline_date = case recurrence
      when 'daily' then base_date + 1.day 
      when 'weekly' then base_date + 1.week
      when 'monthly' then base_date + 1.month
      when 'yearly' then base_date + 1.year
      when 'six_months' then base_date + 6.months
      when 'weekdays'
        next_weekday_occurrence(base_date, stored_weekdays)
      when 'custom' 
        if custom_recurrence_number.present? && custom_recurrence_unit.present?
          interval = custom_recurrence_number.to_i.send(custom_recurrence_unit)
          next_date = base_date + interval

          # Jumps forward for completion date selected
          if recurrence_type == "completion_date"
            while next_date <= Date.today
              next_date += interval
            end
          end 

          next_date
        else 
          base_date
        end
    end

    # With new deadline_date, the completion status is reset
    self.completed = false

    # Raises error if there are validation errors
    save!
  end

  def stored_weekdays
    return [] if weekday_recurrence.blank?
    weekday_recurrence.split(",").map(&:to_i)
  end

  def next_weekday_occurrence(base_date, weekdays)
    return base_date if weekdays.blank?

    # Sets each weekday to a number
    weekdays = weekdays.map(&:to_i)

    # Finds next occurence based on next closest weekday based on selection
    1.upto(7) do |i|
      candidate = base_date + i.days
      return candidate if weekdays.include?(candidate.wday)
    end

    base_date
  end

  def recurrence_threshold
    case recurrence
    when "weekdays"       then 1.day
    when "daily"          then 1.day
    when "weekly"         then 1.week
    when "six_months"     then 6.months
    when "monthly"        then 1.month
    when "yearly"         then 1.year
    when "custom"
      if custom_recurrence_number.present? && custom_recurrence_unit.present?
        custom_recurrence_number.to_i.send(custom_recurrence_unit)
      else
        0.days
      end
    else
      0.days
    end
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
