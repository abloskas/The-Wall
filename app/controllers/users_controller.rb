class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.find_or_create_by(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to posts_index_url
    else
      flash[:user_errors] = @user.errors.full_messages
      redirect_to users_new_path
    end
  end

  def logout
    session[:username] = nil
    redirect_to users_new_url
  end

  private
    def user_params
      params.require(:user).permit(:username)
    end 

end
