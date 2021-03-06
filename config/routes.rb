Rails.application.routes.draw do
  root 'posts#index', as: 'home'
  get '/createaccount', to: 'authors#new', as: 'log_in'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resources :sessions
  resources :authors
  resources :posts do
    resources :comments do
    member do
        post :publish
      end
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
