class Book < ApplicationRecord
  belongs_to :student, optional: true
  belongs_to :library
  has_many :hold_book_trackers, :dependent => :destroy
  has_one_attached :cover

  def self.createNewCheckoutEntry?(bookid,studentid)
    currentDate = Date.current
    dueDate = Date.current.next_day(Book.find(bookid).library.bookBorrowingDaysLimit)
    bookHistory = BookHistory.new(:dueDate=> dueDate, :issueDate=>currentDate,:book_id=>bookid,:student_id=>studentid)
    bookHistory.save
  end

  def self.updateExistingCheckoutEntry?(bookid,studentid)
    returnDate = Date.current
    bookHistory = BookHistory.find_by(returnDate: nil, book_id: bookid, student_id: studentid)
    if bookHistory.update(:returnDate=>returnDate)
      if returnDate > bookHistory.dueDate
        student = Student.find(studentid)
        book = Book.find(bookid)
        diff = returnDate - bookHistory.dueDate
        current_fine = book.library.overdueFine * diff.to_i
        previous_fine = student.overdueFromReturnedBooks
        previous_fine.present? ? student.update(:overdueFromReturnedBooks=>previous_fine+current_fine) : student.update(:overdueFromReturnedBooks=>current_fine)
      else
        return true
      end
    end

  end 

  def self.updateAvailableCounter?(bookid,adder)
      	updateBook = Book.find(bookid)
        availableCounter = updateBook.available + adder
	      updateBook.update(:available=>availableCounter)
  end

end
