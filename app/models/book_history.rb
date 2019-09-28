class BookHistory < ApplicationRecord
  has_many :books
  has_many :accounts
end
