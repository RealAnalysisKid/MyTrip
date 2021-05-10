Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :cities do
    resources :posts
  end

  namespace :admin do
    resources :cities do
      member do
        post :publish
        post :hide
      end
      resources :posts do
        member do
          post :publish
          post :hide
        end
      end
    end
  end

  namespace :account do
    resources :cities
    resources :posts
  end

  root 'cities#index'

end
