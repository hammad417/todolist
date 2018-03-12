Rails.application.routes.draw do
  devise_for :users
  resources :lists do
    resources :tasks do
      member do
        put :state
      end
    end
  end
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'users#index'

end
