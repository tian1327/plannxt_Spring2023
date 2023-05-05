class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def events360
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      @user.update_events360_credentials(request.env['omniauth.auth'])
      sign_in_and_redirect @user, event: :authentication # This will throw if @user is not activated
      set_flash_message(:notice, :success, kind: 'Events360') if is_navigational_format?
    else
      session['devise.oauth2_data'] = request.env['omniauth.auth'].except(:extra) # Removing extra as it can overflow some session stores
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end