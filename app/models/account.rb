class Account < ApplicationRecord
  has_one :student, dependent: :restrict_with_error
  has_one :librarian, dependent: :restrict_with_error
  has_many :books, dependent: :restrict_with_error
  has_many :book_histories, dependent: :restrict_with_error
end
