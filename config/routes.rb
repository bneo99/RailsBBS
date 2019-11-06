Rails.application.routes.draw do

  devise_for :users, controllers: {
	registrations: 'users/registrations'
      }
  get 'home/index'
  resources :posts
  root 'home#index'
end
