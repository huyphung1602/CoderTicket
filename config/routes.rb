Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create]
  resources :events do
    resources :tickets
    member do
      post 'publish'
    end
  end
  
  root 'home#index'
  get 'upcoming' => 'events#index'
  delete 'log_out' => 'sessions#destroy'
end
