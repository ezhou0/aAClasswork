class PostsController < ApplicationController
    def new
        @post = Post.new 
       # @sub = Sub.find_by(id: params[:sub_id])
        render :new
    end

    def create
        @post = current_user.posts.new(post_params)
       # @post.sub_id = params[:sub_id]
        if @post.save
            redirect_to post_url(@post)
        else
            flash.now[:errors] = @post.errors.full_messages
            render :new
        end
    end

    def show
        @post = Post.find_by(id: params[:id])
        render :show
    end

    def edit
        @post = Post.find_by(id: params[:id])
        render :edit
    end

    def update
        @post = Post.find_by(id: params[:id])
        # @post.sub_id = params[:sub_id]
        if @post.update(post_params)
            redirect_to post_url(@post)
        else
            flash.now[:errors] = @post.errors.full_messages
            render :edit
        end
    end

    def destroy
        @post = Post.find_by(id: params[:id])
        if @post.destroy
            redirect_to sub_url(@post.sub_id)
        end
    end

    private
    def post_params
        params.require(:post).permit(:title, :url, :content, sub_ids: [])
    end
end
