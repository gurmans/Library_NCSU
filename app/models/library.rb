class Library < ApplicationRecord
  # attr_accessor :university_id
  belongs_to :university
  validates :name , presence: true,  uniqueness: true
  validates :location , presence: true
  validates :bookBorrowingDaysLimit , presence: true
  validates :overdueFine , presence: true
  validates :university_id , presence: true
end
