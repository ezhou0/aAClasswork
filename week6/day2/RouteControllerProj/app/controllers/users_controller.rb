class UsersController < ApplicationController
    def index
        debugger
        if params[:username]
            user = User.where('username LIKE ?', "%#{params[:username]}%")
        else
            user = User.all
        end
        render json: user

    end

    def create
        user = User.new(params.require(:user).permit(:name, :email))
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        render json: User.find(params[:id])
    end

    def update
       # debugger
        user = User.find(params[:id])
        if user.update(user_params)
            render json: user
        else 
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        user = User.find(params[:id])
        
        user.destroy

        render json: user
    end

    private

    def user_params
        params.require(:user).permit(:name, :email)
    end

end