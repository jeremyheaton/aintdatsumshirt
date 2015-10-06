Rails.application.routes.draw do
  devise_for :users
  resources :users, :only => [:show]
  resources :photos do
    resources :comments
  end
  resources :votes , :only => [:create]
  root :to => 'photos#index'
  resources :charges
end
