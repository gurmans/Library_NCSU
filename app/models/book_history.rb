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
end
