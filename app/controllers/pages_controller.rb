class PagesController < ApplicationController
  
  def home
	if admin_signed_in?
		redirect_to pages_adminhome_path
	elsif librarian_signed_in?
		redirect_to pages_librarianhome_path
	elsif student_signed_in?
		redirect_to pages_studenthome_path
	else
		render layout: false
	end	
  end

  def adminhome
	if !admin_signed_in?
		redirect_to root_path	
	else
        	@book_histories = BookHistory.GetBookHistory(:admin)
		@book_hold_trackers = HoldBookTracker.GetBookHoldRequests(:admin)
		@librarians_request_list = Admin.GetLibrariansForApproval()
	end 
  end

  def studenthome
	if !student_signed_in?
                redirect_to root_path
	else
		@book_histories = BookHistory.GetBookHistory(:student,current_student)
	end
  end

  def librarianhome
	if !librarian_signed_in?
                redirect_to root_path  
	else
		@book_histories = BookHistory.GetBookHistory(:librarian,current_librarian)
		@book_hold_trackers = HoldBookTracker.GetBookHoldRequests(:librarian,current_librarian)
		@book_special_requests = HoldBookTracker.GetBookHoldRequests(:librarian,current_librarian,true)
 	end
  end
end
