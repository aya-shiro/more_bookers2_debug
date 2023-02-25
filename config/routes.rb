Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users
  root to: 'homes#top'
  get "home/about" => "homes#about"

  resources :books, only: [:new,:create,:index,:show,:edit,:destroy,:update] do
    resource :favorites, only: [:create,:destroy]
    resources :book_coments, only: [:create, :destroy]
  end

  resources :users, only: [:index,:show,:edit,:update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end