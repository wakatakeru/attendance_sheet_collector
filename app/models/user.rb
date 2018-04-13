class User < ApplicationRecord
  has_many :attendance_sheets
  has_and_belongs_to_many :subjects

  devise :database_authenticatable, :trackable, :validatable
  enum role: {student: 0, auditor: 10, assistant: 20, teacher: 30}

  validates :st_num, presence: true, uniqueness: true
  validates :role,  inclusion: {in: User.roles.keys}

  def admin?
    return true if self.assistant? || self.teacher?
    false
  end
end
