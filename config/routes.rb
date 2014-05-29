PineappleRepairs::Application.routes.draw do

  devise_for :contractors, :controllers => { :registrations => "registrations"}

  resources :problem, only: [:new, :edit, :create, :update]
  resources :models, only: [:new, :edit, :create, :update]
  resources :devices, only: [:new, :edit, :create, :update, :index]
  resources :networks, only: [:new, :edit, :create, :update]

  resources :jobs, only: [:new, :create] do
    collection do
      # stop 404 in wizard
      get '' => :create
      get :unavailable, to: "jobs#unavailable"
    end
  end

  authenticated :contractor do
    resources :jobs, only: [:index, :show]

    resources :contractors do
      member do
        post :verify, to: "contractors#verify"
      end

      resources :jobs, only: [] do
        member do
          post :accept, to: "jobs#accept"
          post :finish, to: "jobs#finish"
        end

        collection do
          get :current, to: "jobs#current"
          get :finished, to: "jobs#finished"
          get :available, to: "jobs#available"
        end
      end
    end
  end

  get "/contact",  to: "pages#contact"
  get "/about",    to: "pages#about"
  get "/repairs",  to: "devices#index"

  root 'pages#index'
end
