Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'about', to: 'pages#about'
  get 'own_equipment', to: 'equipment#own_equipment'
  get 'own_bookings', to: 'bookings#own_bookings'
  patch 'booking/:id/validate', to: "bookings#validate", as: :validate_booking

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :equipment, only: [:create, :new, :edit, :show, :update, :destroy] do
      resources :bookings, except: [:destroy]
      collection do
        get :search
      end
      resources :reviews, only: [:create, :destroy, :index]
  end
end
