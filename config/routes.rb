Rails.application.routes.draw do
  devise_for :users
  resources :messages, only: :index
  root to: "messages#index"
  # resources :groups, only: [:index, :new, :edit] do
  #   resources :messages, only: :index
  # end
end
