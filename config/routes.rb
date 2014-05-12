PineappleRepairs::Application.routes.draw do
  devise_for :contractors
  resources :jobs

  get "/contact",  to: "pages#contact"
  get "/about",    to: "pages#about"

  root to: "pages#index"
end
