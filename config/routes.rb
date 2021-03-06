Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'dashboard', to: 'authors#dashboard'


  resource :clients , except: [ :new, :create, :index ]

  resource :authors, except: [ :new, :create ] do
    resources :books, except: [ :show ]
  end

  resources :authors, only: [ :new, :create, :show ]


  resources :books, only: [ :show ] do
    resources :book_transactions, only: [ :create, :new, :update ]
    collection do
      get 'search', to: 'books#search'
    end
    member do
      get "buy", to: "books#buy"
      get "pay", to: "books#pay"
      get "bought", to: "books#bought"
    end
    resources :reviews, only: [:new, :create, :index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
