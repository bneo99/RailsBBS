Rails.application.routes.draw do

  get 'home/index'
  get '/posts/all' => 'posts#all' 
  devise_scope :user do
    get '/users/all' => 'users/registrations#all'
    delete '/users/all' => 'users/registrations#remove'
    patch '/users/all' => 'users/registrations#toggleadmin'
    get '/users/all/edit' => 'users/registrations#adminedit'
    put '/users/all/edit' => 'users/registrations#adminupdate'
  end
  devise_for :users, controllers: {
	registrations: 'users/registrations'
      }
  resources :posts
  root 'home#index'
end
