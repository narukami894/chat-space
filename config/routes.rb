Rails.application.routes.draw do
  devise_for :users, only: %i(sessions registrations)
  root to: "groups#index"
  resources :groups, except: %i(destroy show) do
    resources :messages, only: %i(index create)
  end
end
