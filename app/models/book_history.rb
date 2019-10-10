class BookHistory < ApplicationRecord
  belongs_to :book
  belongs_to :student
  
  def self.checkIfAlreadyIssued?(bookid,studentid)
  	isIssued = BookHistory.where(:returnDate=>nil,:book_id=>bookid,:student_id=>studentid)
       	if isIssued.count > 0
        	return true
       	else
        	return false		
       	end    		
  end
  
  def self.GetBookHistory(type,user = nil,bookid = nil)
	# if bookid is not nil that means request is for getting book history of specific book
	# if bookid nil (not passed) then we will fetch from history checked out books according to user logged in
	if bookid
		bookHistory = BookHistory.where(:book_id=>bookid)
	else
		case type
		when :admin
			bookHistory = BookHistory.where(:returnDate=>nil)	
		when :student
			if user
				bookHistory = BookHistory.where(:student_id=>user.id,:returnDate=>nil)
			end
		when :librarian
			if user
				bookHistory = BookHistory.where(:book_id=>Book.where(:library_id=>user.library.id),:returnDate=>nil)
			end
		end	
	end
	return bookHistory	
  end
	 
  def self.checkMaxLimitReached?(studentid)
		maxLimit = Student.find(studentid).program.maxNumberOfBooksIssuable
		return BookHistory.where(:student_id=>studentid,:returnDate=>nil).count >= maxLimit
  end
end
