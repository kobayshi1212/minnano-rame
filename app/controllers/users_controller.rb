class UsersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit]
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
  
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.guest_user?
      redirect_to mypage_path , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end

end
