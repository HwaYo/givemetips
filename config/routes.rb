Rails.application.routes.draw do
  root 'goals#new'

  devise_for :users

  resources :goals do
    resources :comments
  end
end
