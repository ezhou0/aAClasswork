class SessionsController < ApplicationController
    def new
        render :new
    end

    def create
        user = User.find_by_credentials(
            params[:user][:email],
            params[:user][:password]
        )
        if user
            login_user!(user) #write this later
            #debugger
            redirect_to user_url(user)#write this later
        else
            flash[:errors] = ["invalid credentials"]
            redirect_to new_session_url
        end
    end

    def destroy
        # user = User.find_by(params: params[:id])
        # user.destroy
        # render :

        current_user.reset_session_token!
        session[:session_token] = nil 
        redirect_to new_session_url
    end
end
