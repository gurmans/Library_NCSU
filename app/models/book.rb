class Book < ApplicationRecord
  belongs_to :student, optional: true
  belongs_to :library
  has_many :hold_book_trackers, :dependent => :destroy
  has_one_attached :cover
end
