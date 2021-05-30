Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :users do
    resource :follow
    resources :followings
    resources :followers
  end

  resources :dogs do
    resource :favorites, only: [:create, :destroy]
  end

end
