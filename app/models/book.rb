class Book < ApplicationRecord
  belongs_to :student, optional: true
  belongs_to :library
end
