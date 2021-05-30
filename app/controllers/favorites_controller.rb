class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.create(dog_id: params[:dog_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @dog = Dog.find(params[:dog_id])
    @favorite = current_user.favorites.find_by(dog_id: @dog.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
