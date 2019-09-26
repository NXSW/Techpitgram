Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resources :comments
  end
  root 'posts#index'
  post '/like/:post_id', to:'likes#like'
  delete '/like/:post_id', to:'likes#unlike'
end
