Rails.application.routes.draw do
  devise_for :users
  root to: "pages#landing"
  get "home", to: "pages#home"
  get "splash", to: "pages#splash"
  get '/weaviate/create_schema', to: 'weaviate#create_schema'
  
  resources :recommendations
  patch "recommendations/:id/archive", to: "recommendations#archive"
  resources :lists, only: %i[show new create destroy] do
    resources :recommendation_lists, only: %i[create destroy]
  end

  resources :users, only: %i[show]

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
end
