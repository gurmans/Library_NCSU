class HoldBookTracker < ApplicationRecord
  belongs_to :book
  belongs_to :student

  def approve_special_collection_requests?(bookid, studentid)
    if Book.find(bookid).specialCollection
      Book.createNewCheckoutEntry?(bookid,studentid)
      Book.updateAvailableCounter?(bookid,-1)
      return HoldBookTracker.find_by(:bookid=>bookid,:studentid=>studentid)&.destroy
    end
    return true
  end
end
