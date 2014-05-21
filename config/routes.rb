PineappleRepairs::Application.routes.draw do

  devise_for :contractors

  resources :devices, only: [:index]

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
      resources :jobs, only: [] do
        member do
          post :accept, to: "jobs#accept"
          post :finish, to: "jobs#finish"
        end
      end
    end
  end

  get "/contact",  to: "pages#contact"
  get "/about",    to: "pages#about"
  get "/products",  to: "devices#index"

  root 'pages#index'
end
