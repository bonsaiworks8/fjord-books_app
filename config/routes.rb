Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: 'books#index'
  resources :books
  resources :users do
    member do
      get :followings, to: 'binding_users#followings'
      get :followers, to: 'binding_users#followers'
      post :followings, to: 'binding_users#create'
      delete :followings, to: 'binding_users#destroy'
    end
  end
  resources :users, only: %i(index show)
end
