PineappleRepairs::Application.routes.draw do

  devise_for :contractors

  resources :jobs do
    collection do
      # stop 404 in wizard
      get '' => :create
      get :unavailable, to: "pages#unavailable"
    end
  end

  resources :devices

  get "/about",    to: "pages#about"
  get "/products",  to: "devices#index"

  root to: "pages#index"
end
