Rails.application.routes.draw do
  get 'customers/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :customers, only: [:index] do
    collection do
      get 'missing_email'
      get 'alphabetized'
    end
  end

  root 'customers#index'
end
