class ApplicationController < ActionController::Base
    helper_method :current_user

    def current_user
        @current_user = User.find_by(session_token: session[:session_token])
    end

    def logout_user!
        current_user.reset_session_token!   
        session[:session_token] = nil
    end

    def login_user!
        session[:session_token] = @user.reset_session_token!
    end

    def already_signed_in
        redirect_to cats_url if current_user
    end
end
