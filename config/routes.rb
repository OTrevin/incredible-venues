Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/account', to: "pages#account"
  get '/account/profile', to: "pages#profile"
  get '/account/bookings', to: "pages#bookings"
  get '/account/bookings/:id/edit', to: "pages#edit", as: :edit_booking
  delete '/account/bookings/:id', to: "pages#destroy", as: :delete_booking
  patch '/account/bookings/:id', to: "bookings#update_status", as: :update_booking_status
  get '/account/my_listings', to: "pages#my_listings"
  get '/s', to: "pages#search_result"

  resources :venues do
    resources :bookings, only: [:new, :create, :update]
  end
end
