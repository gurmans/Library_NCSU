class Student < ApplicationRecord
  belongs_to :account
  belongs_to :program
  belongs_to :university
end
