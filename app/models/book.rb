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
  validates :published , presence: true
  validates :cover, blob: { content_type: ['image/png', 'image/jpeg'], size_range: 1..5.megabytes }

  def self.createNewCheckoutEntry?(bookid,studentid)
    currentDate = Date.current
    dueDate = Date.current.next_day(Book.find(bookid).library.bookBorrowingDaysLimit)
    bookHistory = BookHistory.new(:dueDate=> dueDate, :issueDate=>currentDate,:book_id=>bookid,:student_id=>studentid)
    bookHistory.save
  end

  def self.updateExistingCheckoutEntry?(bookid,studentid)
    returnDate = Date.current
    bookHistory = BookHistory.find_by(returnDate: nil, book_id: bookid, student_id: studentid)
    bookHistory.returnDate = returnDate
    book = Book.find(bookid)
    if returnDate > bookHistory.dueDate
      bookHistory.overdue_amount = book.library.overdueFine * (returnDate - bookHistory.dueDate).to_i
    end
    if bookHistory.save
      if returnDate > bookHistory.dueDate
        student = Student.find(studentid)
        diff = returnDate - bookHistory.dueDate
        current_fine = book.library.overdueFine * diff.to_i
        previous_fine = student.overdueFromReturnedBooks
        previous_fine.present? ? student.update(:overdueFromReturnedBooks=>previous_fine+current_fine) : student.update(:overdueFromReturnedBooks=>current_fine)
      else
        return true
      end

      if !book.specialCollection and nextStudentEntries = HoldBookTracker.where(:book_id=> bookid)&.order(:created_at)
        nextStudentEntry = nextStudentEntries.find { |entry| !BookHistory.checkMaxLimitReached?(entry.student.id) }
        if nextStudentEntry
        	self.createNewCheckoutEntry?(bookid,nextStudentEntry.student_id)
        	self.updateAvailableCounter?(bookid,-1)
        	nextStudentEntry.destroy
	end
      end
      return true
    end
    return false	
  end 

  def self.updateAvailableCounter?(bookid,adder)
      	updateBook = Book.find(bookid)
        availableCounter = updateBook.available + adder
	updateBook.update(:available=>availableCounter)
  end


  def self.cancelHoldRequest?(bookid, studentid)
    Book.find(bookid).hold_book_trackers&.find_by_student_id(studentid)&.destroy
  end
end
