class DogsController < ApplicationController
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
    @dog .save
    redirect_to dog_path(@dog)
  end

  def edit
    @dog = Dog.find(params[:id])
  end

  def update
    @dog = Dog.find(params[:id])
    @dog.update(dog_params)
    redirect_to dog_path(@dog)
  end

  private
  def dog_params
    # title,body,imageを許可して保存
    params.require(:dog).permit(:title, :body, :image)
  end
end
