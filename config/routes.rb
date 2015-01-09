Rails.application.routes.draw do
  devise_for :users

  resources :goals
  root 'goals#new'
end
