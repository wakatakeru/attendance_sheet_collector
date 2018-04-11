class AttendanceSheet < ApplicationRecord
  belongs_to :user
  belongs_to :lesson

  validates :comment, presence: true
  validates :summary, presence: true
end
