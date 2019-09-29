class Student < ApplicationRecord
  belongs_to :program
  belongs_to :university
end
