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

  get "/about",    to: "pages#about"
  get "/products",  to: "pages#products"

  root to: "pages#index"
end
