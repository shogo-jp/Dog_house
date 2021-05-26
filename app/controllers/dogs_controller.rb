class DogsController < ApplicationController
  before_action :authenticate_user!, except: [:index]                   # deviseのヘルパーを活用して
                                                                        # ログインしていない人はこの全てのアクションにアクセスできないようにする。ただしindexは見れるようにする
  def index
    @dogs = Dog.all
  end

  def show
    # dogを一つ取って、URLの所からidの番号を一つとってくる
    @dog = Dog.find(params[:id])
  end

  def new
    # dogモデルから空のモデルを持ってくる
    @dog = Dog.new
  end
  # データベースに登録
  def create
    @dog = Dog.new(dog_params)
    @dog.user_id = current_user.id
    if @dog.save
      redirect_to dog_path(@dog), notice: '投稿しました'
    else
      render :new       # バリデーション
    end

  end

  def edit
    @dog = Dog.find(params[:id])
    if @dog.user != current_user       # dogに結びついているuserとcurrent_userが等しくなかったら
       redirect_to dog_path, alert: 'ログインして下さい'
    end
  end

  def update
    @dog = Dog.find(params[:id])
    if @dog.update(dog_params)
      redirect_to dog_path(@dog), notice: '更新しました'
    else
      render :edit
    end
  end

  def destroy
    dog = Dog.find(params[:id])
    dog.destroy
    redirect_to dogs_path
  end

  private
  def dog_params
    # title,body,imageを許可して保存
    params.require(:dog).permit(:title, :body, :image, :dogname)
  end
end


