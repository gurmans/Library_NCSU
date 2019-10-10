class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # replace with your authenticate method
  

  def google_oauth2
    auth = request.env["omniauth.auth"]
    user = Student.where(provider: auth["provider"], uid: auth["uid"])
            .first_or_initialize(email: auth["info"]["email"])
    user.name ||= auth["info"]["name"]
    user.password = 'abcdef'
    user.program_id = '1'
    user.university_id = '1'
    user.save!

    user.remember_me = true
    sign_in(:user, user)

    redirect_to pages_studenthome_path
  end
end