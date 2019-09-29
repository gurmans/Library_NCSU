class Librarian < ApplicationRecord
  belongs_to :account
  belongs_to :library
end
