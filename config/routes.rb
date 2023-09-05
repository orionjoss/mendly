Rails.application.routes.draw do
  devise_for :users
  root to: "pages#landing"
  get "home", to: "pages#home"

  resources :recommendations
  patch "recommendations/:id/archive", to: "recommendations#archive"
  resources :lists, only: %i[show new create destroy] do
    resources :recommendation_lists, only: %i[create destroy]
  end

  resources :users, only: %i[show]

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
