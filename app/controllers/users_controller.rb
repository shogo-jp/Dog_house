class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to users_path, alert: 'ログインして下さい'
    end
  end

  def update
    # どのユーザーを更新するのか見つけて@userに入れる
    @user = User.find(params[:id])
    # @userを更新する
    if @user.update(user_params)
        # ユーザーの詳細画面に戻る
        redirect_to user_path(@user), notice: '更新しました'
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :profile, :profile_image)
  end
end
