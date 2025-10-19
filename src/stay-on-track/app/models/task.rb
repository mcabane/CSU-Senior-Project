class Task < ApplicationRecord
  RECURRENCE_OPTIONS = %w[monthly six_months yearly custom]
  URGENCY_OPTIONS = %w[low medium high]
  DEADLINE_TYPES = %w[flexible concrete]

  validates :recurrence, inclusion: { in: RECURRENCE_OPTIONS }
  validates :urgency, inclusion: { in: URGENCY_OPTIONS }
  validates :deadline_type, inclusion: { in: DEADLINE_TYPES }

  belongs_to :user
end
