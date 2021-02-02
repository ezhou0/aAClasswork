class Api::TodosController < ApplicationController
    def show
        render json: Todo.find_by(params: params[:id])
    end

    def create
        @todo = Todo.new(todo_params)
        if @todo.save
            render json: @todo
        else
            render json: @todo.errors.full_messages, status: 422
        end
    end

    def index 
        @todos = Todo.all
        render json: @todos
    end

    def update
        @todo = Todo.new(todo_params)
        success = @todo.update(todo_params)
        if success
            render json: @todo
        else
            render json: @todo.errors.full_messages, status: 422
        end
    end

    def destroy
        @todo = Todo.find(params[:id])
        @todo.delete
        render json: @todo
    end

    def todo_params
        params.require(:todo).permit(:title, :body, :done)
    end
end