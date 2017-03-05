Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create]
  resources :venues, only: [:new, :create]
  resources :events do
    resources :tickets
    resources :ticket_types, only: [:new, :create]
    member do
      post 'publish' => 'events#have_enough_ticket_types?'
    end
  end
  
  root 'home#index'
  get 'upcoming' => 'events#index'
  delete 'log_out' => 'sessions#destroy'
end
