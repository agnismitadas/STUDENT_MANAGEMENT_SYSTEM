Rails.application.routes.draw do
  #devise_for :admin_users

  devise_for :admin_users, controllers: {
    sessions: 'admin_users/sessions', registrations:'admin_users/registrations'
  }

  devise_scope :admin_user do  
    get '/admin_users/sign_out' => 'devise/sessions#destroy'     
 end 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'welcome#index'
  get '/dashboard', to: 'admin#dashboard', as: 'dashboard'
  namespace :admin do
      get 'dashboard', to: 'dashboard#index'
      resources :students
      resources :courses
      resources :projects
    end    
  end
