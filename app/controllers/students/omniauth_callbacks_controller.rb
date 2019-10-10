# frozen_string_literal: true

class Students::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
   devise :omniauthable, omniauth_providers: [:google_oauth2]

  # You should also create an action method in this controller like this:
  def google_oauth2
    auth = request.env["omniauth.auth"]
    user = Student.where(provider: auth["provider"], uid: auth["uid"])
            .first_or_initialize(email: auth["info"]["email"])
    user.name ||= auth["info"]["name"]
    user.program_id = '1'
    user.university_id = '1'
    user.save!

    user.remember_me = true
    sign_in(:user, user)

    redirect_to pages_studenthome_path
  end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
