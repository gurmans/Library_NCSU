class ExampleMailer < ApplicationMailer
	default :from => 'jpgruby123@gmail.com'
	
	def send_email(user)
		puts "hello"
  		@user = user
  		mail to: @user.email, subject: 'Book Checked out'
 	end
end
