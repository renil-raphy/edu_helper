Rails.application.routes.draw do

  constraints :subdomain => "admin" do
    scope :module => "admin", :as => "admin" do

      match '/update_password' => 'password#update_password', via: :post
      resources :admins, only: [:index, :new, :create]
      devise_for :admins, controllers: {
        sessions: 'admin/admins/sessions',
      }
      resources :admins, only: [:destroy]
      resources :universities, except: [:destroy]
      resources :districts, except: [:destroy]
      resources :locations, except: [:destroy]
      resources :categories, except: [:destroy, :show]
      resources :questions, except: [:destroy, :show]

      get '/' => 'dashboard#index', as: 'root'
    end
  end

  constraints :subdomain => "app" do
    scope :module => "app", :as => "app" do

      # Devise and Users
      devise_for :users, controllers: {
        sessions: 'app/users/sessions',
        registrations: 'app/users/registrations',
        confirmations: 'app/users/confirmations',
        passwords: 'app/users/passwords'
      }, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "sign_up" }

      get '/settings/profile' => 'users#edit'
      post '/profile/update' => 'users#update'
      match '/update_password' => 'password#update', via: :patch

      resources :answers, only: [:new, :create]

      get '/' => 'dashboard#index', as: 'root'
    end
  end

  root :to => 'app/dashboard#index'
end
