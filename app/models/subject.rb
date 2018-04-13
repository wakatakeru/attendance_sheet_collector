class Subject < ApplicationRecord
  has_many :lessons, dependent: :destroy
  has_and_belongs_to_many :users

  validates :name, presence: true, uniqueness: true
  validates :display_name, presence: true, uniqueness: true
  validates :term, presence: true
end
