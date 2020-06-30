Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/account', to: "pages#account"
  get '/account/profile', to: "pages#profile"
  get '/account/bookings', to: "pages#bookings"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :venues
end
