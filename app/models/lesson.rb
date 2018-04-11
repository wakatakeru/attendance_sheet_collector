class Lesson < ApplicationRecord
  belongs_to :subject
  has_many :attendance_sheets, dependent: :destroy

  validates :week, presence: true
end
