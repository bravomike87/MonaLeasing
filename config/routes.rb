Rails.application.routes.draw do

  get 'bookings/new'
  root to: 'pages#home'
  get 'user/:id/dashboard', to: 'pages#dashboard'
  get 'contact', to: 'pages#contact'
  get 'about', to: 'pages#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :artworks do
    resources :bookings, only: [:create ]
  end
  resources :bookings, only: [:destroy]

  resources :profiles, except: [:index]

end
