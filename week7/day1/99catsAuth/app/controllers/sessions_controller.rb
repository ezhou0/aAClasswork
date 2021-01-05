class SessionsController < ApplicationController

    before_action :already_signed_in
    def create
        @user = User.find_by_credentials(params[:user][:username],params[:user][:password])

        if @user 
            login_user!
            redirect_to cats_url
        else
            render :new
        end
    end

    def new
        @user = User.new
        render :new
    end

    def destroy
        logout_user!
        redirect_to new_session_url
    end
end
