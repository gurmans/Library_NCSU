class Book < ApplicationRecord
  belongs_to :student, optional: true
  belongs_to :library
  has_many :hold_book_trackers, :dependent => :destroy

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
