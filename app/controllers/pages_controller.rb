class PagesController < ApplicationController
  
  def home
	render layout: false
  end

  def adminhome
	if !admin_signed_in?
		redirect_to root_path	
	else
        	@book_histories = BookHistory.GetBookHistory(:admin)
					@book_histories.each do |history| if history.dueDate != nil and Date.current > history.dueDate and book = Book.find(history.book_id)
																							history.overdue_amount = book.library.overdueFine * (Date.current - history.dueDate).to_i
																						end
					end

	end 
  end

  def studenthome
	if !student_signed_in?
                redirect_to root_path
	else
		@book_histories = BookHistory.GetBookHistory(:student,current_student)
		@book_histories.each do |history| if history.dueDate != nil and  Date.current > history.dueDate and book = Book.find(history.book_id)
																				history.overdue_amount = book.library.overdueFine * (Date.current - history.dueDate).to_i
																			end
		end

	end
  end

  def librarianhome
	if !librarian_signed_in?
                redirect_to root_path  
	else
		@book_histories = BookHistory.GetBookHistory(:librarian,current_librarian)
		@book_histories.each do |history| if history.dueDate != nil and  Date.current > history.dueDate and book = Book.find(history.book_id)
																				history.overdue_amount = book.library.overdueFine * (Date.current - history.dueDate).to_i
																			end
		end

	end
  end
end
