Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  get "home/about" => "homes#about"
  resources :books, only: [:index, :new, :show, :create, :edit, :delete, :update, :destroy]
  resources :users, only: [:edit, :show, :index, :edit, :update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
