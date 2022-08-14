Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/', to: 'static_pages#home'
  get '/next', to: 'static_pages#about'
  # Defines the root path route ("/")
  # root "articles#index"
end
