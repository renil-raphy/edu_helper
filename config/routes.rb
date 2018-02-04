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

      get '/' => 'dashboard#index', as: 'root'
    end
  end

  root :to => 'app/dashboard#index'
end
