Rails.application.routes.draw do
  get 'users/profile'
  devise_scope :user do
    # Redirests signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  get '/u/:id', to: 'users#profile', as: 'user'

  resources :posts

  root 'posts#index'
  get 'about', to: "pages#about"
  get 'home', to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
