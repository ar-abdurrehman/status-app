Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: "json" } do
    get "/index", to: "home#index", defaults: { format: "json" }
  end
  
  # Defines the root path route ("/")
  root "home#index"
end
