Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [] do
    resources :authors, only: [ :new, :create ]
    resources :book_transactions, only: [ :new, :create ]
  end

  resources :clients , except: [ :new, :create, :index ] do
    resources :book_transactions, only: [ :create, :new, :update ]
  end
  resources :authors, except: [ :new, :create ] do
    resources :books, except: [ :index ]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
