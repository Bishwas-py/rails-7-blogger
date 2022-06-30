Rails.application.routes.draw do
  get 'users/profile'

  devise_for :users

  devise_scope :user do
    # Redirests signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end

  get '/u/:id', to: 'users#profile', as: 'user'

  resources :posts do
    resources :comments
  end


  get 'home', to: "pages#home"
  get 'about', to: "pages#about"

  root 'posts#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
