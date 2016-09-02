Rails.application.routes.draw do

  devise_for :users

  resources :recipes do
    post :like
    post :dislike
    resources :reviews, except: :show
  end

  resources :chefs, only: [:index, :show, :update]
  resources :styles, only: [:index, :show]
  resources :ingredients, only: [:index, :show, :destroy] do
    resources :images, only: [:index, :update], controller: 'ingredients/images'
  end
  resource :profile, only: [:show, :edit]

  root 'pages#home'

  namespace :api do
    namespace :v1 do
      resources :categories, only: [:show]
    end
  end
end
