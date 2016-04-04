Rails.application.routes.draw do

  devise_for :users

  resources :recipes do
    post :like
    post :dislike
    resources :reviews, except: [:index]
  end

  resources :chefs, only: [:index, :show, :update]
  resources :styles, only: [:index, :show]
  resources :ingredients, only: [:index, :show]
  resource :profile, only: [:show, :edit]

  root 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
