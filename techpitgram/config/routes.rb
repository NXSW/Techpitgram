Rails.application.routes.draw do
  devise_for :users
  resource :posts, only: [:index, :new, :create, :destroy]
  root 'posts#index'

end
