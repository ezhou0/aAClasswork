class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    def current_user
        return nil unless session[:session_token] ##this line is good practice
       @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def logged_in?
        !!current_user
    end
    
    def login_user!(user)
        session[:session_token] = user.reset_session_token!
        @current_user = user ##this line is good practice
    end

    def logout
        if logged_in?
            current_user.reset_session_token! #not @current user in case current user not hit yet
            @current_user = nil
            session_token[:session_token] = nil
        end
    end

    def require_logged_in
        redirect_to new_session_url unless logged_in?
    end
end
