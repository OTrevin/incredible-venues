Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/account', to: "pages#account"
  get '/account/profile', to: "pages#profile"
  get '/account/bookings', to: "pages#bookings"
  get '/account/bookings/:id/edit', to: "pages#edit", as: :edit_booking
  # patch '/account/bookings/:id', to: "pages#update"
  delete '/account/bookings/:id', to: "pages#destroy", as: :delete_booking
  get '/account/my_listings', to: "pages#my_listings"
  get '/s', to: "pages#search_result"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :venues do
    resources :bookings, only: [:new, :create, :update]
    # resources :bookings, only: [:new, :create, :edit, :update]
  end
   # resources :bookings, only: [:update]
end
