Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'about', to: 'pages#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :equipments, only: [:create, :new, :edit, :show, :update, :destroy] do
    collection do
      get :search
    end
  end
end
