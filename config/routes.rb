Rails.application.routes.draw do
  devise_for :users
  root to: "groups#index"
  resources :groups, only: [:index, :new, :create, :edit] do
    resources :messages, only: [:index, :create]
  end
end
