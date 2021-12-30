Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  namespace :api do
    resources :bands do
      resources :members
    end
  end
end
