class PagesController < ApplicationController
  
  def home
	render layout: false
  end

  def adminhome
	if !admin_signed_in?
		redirect_to root_path	
	else
        	@book_histories = BookHistory.GetBookHistory(:admin)
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
 	end
  end
end
