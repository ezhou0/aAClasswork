class SessionsController < ApplicationController
    before_action :require_signed_in, only: [:destroy]
    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.find_by_credentials(
            params[:user][:username], 
            params[:user][:password])
        if @user
            sign_in(@user)
            redirect_to user_url(@user)
        else
            flash.now[:errors] = ["invalid username or password"]
            redirect_to new_session_url
        end
    end

    def destroy
        sign_out
        redirect_to users_url
    end
end
