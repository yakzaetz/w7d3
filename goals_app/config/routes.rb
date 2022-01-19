Rails.application.routes.draw do
  resources :users, only: [:new, :show, :create, :index] do
    resources :goals, only: [:new, :create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
