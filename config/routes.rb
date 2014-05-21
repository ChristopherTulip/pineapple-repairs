PineappleRepairs::Application.routes.draw do

  devise_for :contractors

  resources :devices

  resources :jobs do
    collection do
      # stop 404 in wizard
      get '' => :create
      get :unavailable, to: "pages#unavailable"
    end
  end

  authenticated :contractor do
  	# get '/contractors', to: 'contractors#show', as: :user_root
    resources :contractors
  	resources :jobs, only: [:index, :show]
  end

  get "/contact",  to: "pages#contact"
  get "/about",    to: "pages#about"
  get "/products",  to: "devices#index"

  root 'pages#index'
end
