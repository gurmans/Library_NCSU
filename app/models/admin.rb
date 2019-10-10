class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
		 
  def self.handleLibrarianApprovalRequest?(librarianid,approve)
	if lib = Librarian.find(librarianid)
	  if approve == "true"
		lib.update_attribute(:approved,true)
		return true
	  else
		return Librarian.find(librarianid)&.destroy.destroyed?
	  end	
    	end
    return false	
  end

  def self.GetLibrariansForApproval()
		return Librarian.where(:approved=>false)
  end	
		 
end
