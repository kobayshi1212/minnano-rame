class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def mypage
    @user = current_user
    render 'show'
  end

  def edit
    @user = User.find(params[:id])
    @post = @user.post
  end
  
  def update
  end
  
end
