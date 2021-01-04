class SessionsController < ApplicationController
    def create
        @user = User.find_by_credentials(params[:user][:username],params[:user][:password])

        if @user 
            redirect_to cat_url
        else
            render :new
        end
    end

    def new
        @user = User.new
        render :new
    end
end
