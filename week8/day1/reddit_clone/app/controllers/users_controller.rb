class UsersController < ApplicationController
    before_action :require_signed_in, only: [:show]
    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            sign_in(@user)
            redirect_to user_url(@user)
        else
            flash.now[:errors] = @users.errors.full_messages
            render :new
        end
    end

    def show
        @user = User.find_by(id: params[:id])
        render :show
    end

    def index
        @users = User.all 
        render :index
    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end

end
