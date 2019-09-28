class Librarian < ApplicationRecord
  has_one :account
  belongs_to :library
end
