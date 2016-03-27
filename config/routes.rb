Rails.application.routes.draw do

  devise_for :users

  resources :recipes do
    post :like
    post :dislike
  end

  resources :chefs

  root 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
