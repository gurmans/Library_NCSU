class ExampleMailer < ApplicationMailer
	default :from => 'rubyprogram2@gmail.com'
	
	def send_email(user)
		puts "hello"
  		@user = user
  		mail to: @user.email, subject: 'Book Checked out'
 	end
end
