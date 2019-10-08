class Book < ApplicationRecord
  belongs_to :student, optional: true
  belongs_to :library
  has_many :hold_book_trackers, :dependent => :destroy
  has_many :book_histories, :dependent => :destroy
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
    dueDate = Date.current.next_day(Book.find(bookid).library.bookBorrowingDaysLimit)
    bookHistory = BookHistory.new(:dueDate=> dueDate, :issueDate=>currentDate,:book_id=>bookid,:student_id=>studentid)
    bookHistory.save
  end

  def self.returnBook?(bookid,studentid)
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
      end
      if newStudentEntry = HoldBookTracker.where(:book_id=> bookid)&.order(:created_at).first
        self.createNewCheckoutEntry?(bookid,newStudentEntry.student_id)
        self.updateAvailableCounter?(bookid,-1)
        HoldBookTracker.destroy(newStudentEntry.id)
      end
      return true
    end

  end 

  def self.updateAvailableCounter?(bookid,adder)
      	updateBook = Book.find(bookid)
        availableCounter = updateBook.available + adder
	updateBook.update(:available=>availableCounter)
  end
end  
