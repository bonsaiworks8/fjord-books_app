Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: 'books#index'
  resources :books
  resources :users, only: %i(index show) do
    member do
      get :followings, to: 'binding_users#followings'
      get :followers, to: 'binding_users#followers'
    end
    resources :followings, controller: :binding_users, only: %i(create destroy)
  end
end
