class PostsController < ApplicationController
  def index
    @posts = Post.includes(:comments).all
    @user = User.find(session[:user_id])
    @errors = flash[:notice]
  end

  def create
    @post = Post.new(post:params[:post], user:params[:user_id])
    @post.user = User.find(session[:user_id])
    unless @post.save
    flash[:notice] = @post.errors.full_messages
    end
    redirect_to posts_index_url

  end

end
