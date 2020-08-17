Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :equipments, only: [:create, :new, :edit, :show, :update, :destroy] do
    collection do
      get :search
    end
  end
end
