class BlogsController < ApplicationController
    before_action :move_to_index, except: :index

    def index
      @blogs = Blog.includes(:user).page(params[:page]).per(5).order("created_at DESC")
      #includes:SQLの発行回数を減らす
    end

    def new
    end

    def create
      Blog.create(title: blog_params[:title], image_url: blog_params[:image_url], content: blog_params[:content], place: blog_params[:place], user_id: current_user.id)
    end

    def destroy
      blog = Blog.find(params[:id])
      blog.destroy if blog.user_id == current_user.id
    end

    def edit
      @blog = Blog.find(params[:id])
    end

    def update
      blog = Blog.find(params[:id])
      if blog.user_id == current_user.id
         blog.update(blog_params) #current_user.idである必要がないから
      end
    end

    def show
      @blog = Blog.find(params[:id])
      @comments = @blog.comments.includes(:user)
    end

    private
    def blog_params
      params.permit(:image_url, :content, :place, :title)
    end

    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end
end
