class University < ApplicationRecord
  has_many :libraries, dependent: :restrict_with_error
  has_many :students, dependent: :restrict_with_error
  validates :name, presence: true, uniqueness: true
end
