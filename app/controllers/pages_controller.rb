class PagesController < ApplicationController
  
  def home
	render layout: false
  end

  def adminhome
	if !admin_signed_in?
		redirect_to root_path
	end
  end

  def studenthome
	if !student_signed_in?
                redirect_to root_path                                                                                           end
  end

  def librarianhome
	if !librarian_signed_in?
                redirect_to root_path                                                                                           end
 
  end
end
