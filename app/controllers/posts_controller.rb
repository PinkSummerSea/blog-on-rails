class PostsController < ApplicationController

    before_action :find_post, except: [:new, :create, :index]

    def new
        @post = Post.new
    end

    def create
        @post = Post.new post_params
        if @post.save
            redirect_to post_path(@post)
        else  
            render :new
        end
    end

    def show
    end

    def index
        @posts = Post.order(created_at: :desc)
    end

    def edit
    end

    def update
        @post.update post_params
        if @post.save
            redirect_to post_path(@post)
        else  
            render :edit
        end

    end

    def destroy 
        @post.destroy
        redirect_to posts_path
    end

    private

    def post_params
        params.require(:post).permit!
    end

    def find_post
        @post = Post.find params[:id]
    end
end