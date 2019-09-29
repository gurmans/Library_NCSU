class BookHistory < ApplicationRecord
  belongs_to :books
  belongs_to :accounts
end
