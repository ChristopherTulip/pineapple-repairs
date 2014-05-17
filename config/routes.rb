PineappleRepairs::Application.routes.draw do
  devise_for :contractors
  resources :jobs

  authenticated :contractor do
  	root 'contractors#show', as: :user_root

  	resources :jobs, only: [:index, :show]
  end

  unauthenticated :contractor do
  	root 'pages#index'
  end


  get "/contact",  to: "pages#contact"
  get "/about",    to: "pages#about"

end
