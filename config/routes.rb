Rails.application.routes.draw do

  root 'pages#home'

  devise_for :users

  resources :recipes do
    post :like
    post :dislike
    resources :reviews, except: :show
  end

  resources :categories, only: [:index, :show, :edit, :update]
  resources :chefs, only: [:index, :show, :update]
  resources :styles, only: [:index, :show]
  resources :ingredients, only: [:index, :show, :destroy] do
    resources :images, only: [:index, :update], controller: 'ingredients/images'
  end
  resource :profile, only: [:show, :edit]

  namespace :api do
    namespace :v1 do
      resources :categories, only: [:index, :show] do
        resources :recipes, only: :index
      end
    end
  end
end
