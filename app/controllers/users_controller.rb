class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    # どのユーザーを更新するのか見つけて@userに入れる
    @user = User.find(params[:id])
    # @userを更新する
    @user.update(user_params)
    # ユーザーの詳細画面に戻る
    redirect_to user_path(@user)
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :profile, :profile_image)
  end
end
