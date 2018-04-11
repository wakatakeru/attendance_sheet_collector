class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :trackable, :validatable
  enum role: {student: 0, auditor: 10, assistant: 20, teacher: 30}

  def admin?
    return true if self.assistant? || self.teacher?
    false
  end
end
