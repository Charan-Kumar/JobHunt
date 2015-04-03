class OmniauthCallbacksController < Devise::OmniauthCallbacksController   
  def linkedin
    auth = env["omniauth.auth"]
    @user = User.connect_to_linkedin(request.env["omniauth.auth"],current_user)
    if @user.persisted?
      token  = auth["extra"]["access_token"].token
      secret = auth["extra"]["access_token"].secret
      request_path = auth["extra"]["access_token"].consumer.options[:request_token_path]
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "LinkedIn"
      sign_in @user, :event => :authentication
      redirect_to :controller => 'linkedin', :action => 'generate_linkedin_oauth_url', :token => token, 
      :secret =>secret, :request_path => request_path
    else
      session["devise.linkedin_uid"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end