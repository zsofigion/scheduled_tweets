Rails.application.routes.draw do
  get "about_us", to: "about#index", as: :about

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update", as: :update_password

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  delete "logout", to: "sessions#destroy"

  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"
  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"

  get "auth/twitter/callback", to: "omniauth_callbacks#twitter"

  resources :twitter_accounts
  # this does all of these:
  # get "twitter_accounts/:id"
  # delete "twitter_accounts/:id"
  resources :tweets

  # get "/", to: "main#index" is equivalent with:
  root to: "main#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
