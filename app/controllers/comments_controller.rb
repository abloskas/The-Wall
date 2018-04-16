class CommentsController < ApplicationController
    def create
        @comment = Comment.new(comment_params)
        @comment.user = User.find(session[:user_id])
        @comment.post = Post.find(params[:id])
        unless @comment.save
            flash[:notice] = @comment.errors.full_messages
        end
        redirect_to posts_index_url
    end
  
    private
    def comment_params
        params.permit(:comment)
    end
  end
  
