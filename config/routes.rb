Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: 'books#index'
  resources :books
  get 'users/:id/followings', to: 'binding_users#followings', as: :followings
  get 'users/:id/followers', to: 'binding_users#followers' , as: :followers
  post 'users/:id/followings', to: 'binding_users#create', as: :follow
  delete 'users/:id/followings', to: 'binding_users#destroy', as: :unfollow
  resources :users, only: %i(index show)
end
