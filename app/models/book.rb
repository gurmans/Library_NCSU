class Book < ApplicationRecord
  belongs_to :account, optional: true
  belongs_to :library
end
