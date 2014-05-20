PineappleRepairs::Application.routes.draw do

  resources :jobs do
    collection do
      # stop 404 in wizard
      get '' => :create
    end
  end

  devise_for :contractors
  resources :jobs do
    collection do
      get :unavailable, to: "pages#unavailable"
    end
  end

  authenticated :contractor do
  	get '/contractors', to: 'contractors#show', as: :user_root

  	resources :jobs, only: [:index, :show]
  end

  root 'pages#index'


  get "/contact",  to: "pages#contact"

  get "/about",    to: "pages#about"
  get "/products",  to: "pages#products"

end
