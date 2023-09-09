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

  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to mypage_path
  end

  private

  def user_params
    params.require(:user).permit(:profile_image, :name, :email)
  end

end
