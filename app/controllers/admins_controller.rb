class AdminsController < ApplicationController
	before_action :authenticate_admin!
	
	def handleLibrarianApprovalRequest
	  respond_to do |format|	
		if params[:id].present? and params[:approve].present?
			if Admin.handleLibrarianApprovalRequest?(params[:id],params[:approve])
				if params[:approve] == "true"			
					redirectWithMessage(format, pages_adminhome_path(), 'Request approved successfully.')
				elsif params[:approve] == "false"				
					redirectWithMessage(format, pages_adminhome_path(), 'Request rejected successfully')
				else
					redirectWithMessage(format, pages_adminhome_path(), 'Request could not be handled due to some error')
				end
			else
				redirectWithMessage(format, pages_adminhome_path(), 'Request could not be handled due to some error')
			end
		else
			redirectWithMessage(format, pages_adminhome_path(), 'Request could not be handled due to some error')
		end
	  end		
	end

	private
  
	def redirectWithMessage(format, destination, message)
		format.html { redirect_to destination, notice: message }
	end 	
end
