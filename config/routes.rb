PineappleRepairs::Application.routes.draw do
  resources :jobs

  get "/contact",  to: "pages#contact"
  get "/about",    to: "pages#about"

  root to: "pages#index"
end
