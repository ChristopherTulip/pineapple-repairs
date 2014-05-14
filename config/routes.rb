PineappleRepairs::Application.routes.draw do
  resources :jobs do
    collection do
      # stop 404 in wizard
      get '' => :create
    end
  end

  get "/contact",  to: "pages#contact"
  get "/about",    to: "pages#about"

  root to: "pages#index"
end
