class PostsController < ApplicationController
    before_action :ensure_poster, only: [:edit, :update, :destroy]
    before_action :require_login, only: [:new, :create, :edit, :update, :destroy]

    def new
        @post = Post.new
        @post.sub_id = params[:sub_id]
        render :new
    end

    def create
        @post = Post.new(post_params)
        
        if @post.save
            redirect_to post_url
        else
            flash.now[:errors] = post.errors.full_messages
        end
    end

    def show
        @post = Post.find_by(id: params[:id])
        @responses = responses(@post)

        if @sub
            render :show
        else
            flash[:errors] = ["Post not found."]
        end

    end

    def edit
        post = Post.find_by(id: params[:id])
        render :edit
    end 

    def update
        post = Post.find_by(id: params[:id])

        if post.update
            redirect_to post_url
        else
            flash.now[:errors] = post.errors.full_messages
            render :edit
        end
    end

    def destroy
        post = Post.find_by(id: params[:id])
        parent_sub = Sub.find_by(id: post.sub_id)
        post.destroy!
        redirect_to sub_url(parent_sub)
    end


    def responses(post)
        all_responses = []
        stack = []
        while stack
    end

    private

    def ensure_poster
        post = Post.find_by(id: params[:id])
        unless current_user.id == post.author_id
            flash[:errors] = "Only the poster can update/delete their post."
            redirect_to post_url(post)
        end
    end

    def post_params
        params.require(:post).permit(:title, :url, :content, :sub_id, :author_id)
    end
end