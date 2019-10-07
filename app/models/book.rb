class Book < ApplicationRecord
  belongs_to :student, optional: true
  belongs_to :library
  has_many :hold_book_trackers, :dependent => :destroy
  has_one_attached :cover
  validates :ISBN, uniqueness: true
  validates :title , presence: true 
  validates :Author , presence: true
  validates :library_id , presence: true
  validates :language , presence: true
  validates :published , presence: true
  validates :edition , presence: true
  validates :cover , presence: true
  validates :summary , presence: true
  validates :specialCollection , presence: true
  validates :published , presence: true


  def self.createNewCheckoutEntry?(bookid,studentid)
	currentDate = Date.current
	bookHistory = BookHistory.new(:issueDate=>currentDate,:book_id=>bookid,:student_id=>studentid)
	bookHistory.save	
  end

  def self.updateExistingCheckoutEntry?(bookid,studentid)
	currentDate = Date.current
	bookHistory = BookHistory.where(:returnDate=>nil,:book_id=>bookid,:student_id=>studentid)
	bookHistory.update(:returnDate=>currentDate)	
  end 

  def self.updateAvailableCounter?(bookid,adder)
	updateBook = Book.find(bookid)
        availableCounter = updateBook.available + adder
	updateBook.update(:available=>availableCounter)
  end	 	
end
