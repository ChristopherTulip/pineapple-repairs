PineappleRepairs::Application.routes.draw do
  root to: "pages#index"

  resources :jobs

end
