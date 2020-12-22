Rails.application.routes.draw do
  root 'posts#index', as: 'home'

  resources :posts do
    resources :comments do
    member do
        post :publish
      end
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
