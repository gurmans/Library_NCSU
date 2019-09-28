class Student < ApplicationRecord
  has_one :account
  belongs_to :program
  belongs_to :university
end
