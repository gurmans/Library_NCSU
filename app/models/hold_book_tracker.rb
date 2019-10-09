class HoldBookTracker < ApplicationRecord
  belongs_to :book
  belongs_to :student

  def self.GetBookHoldRequests(type,user = nil,isSpecialCollectionView = false)
	case type
	when :admin
		book_hold_requests = HoldBookTracker.all
	when :librarian
		if user
			if isSpecialCollectionView
				book_hold_requests = HoldBookTracker.where(:book_id=>Book.where(:library_id=>user.library.id,:specialCollection=>true))
			else
				book_hold_requests = HoldBookTracker.where(:book_id=>Book.where(:library_id=>user.library.id))
			end	
		end	
    end
	return book_hold_requests
  end
  
  def self.handleSpecialCollectionRequest?(bookid,studentid,approve)
	if Book.find(bookid).specialCollection
	  if approve
		Book.createNewCheckoutEntry?(bookid,studentid)
		Book.updateAvailableCounter?(bookid,-1)
		return HoldBookTracker.find_by(:book_id=>bookid,:student_id=>studentid)&.destroy
	  else
		return HoldBookTracker.find_by(:book_id=>bookid,:student_id=>studentid)&.destroy
	  end	
    end
    return false	
  end
end
