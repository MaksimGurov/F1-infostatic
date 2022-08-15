Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/', to: 'static_pages#home'
  get '/constructor_standings', to: 'static_pages#constructors'
  get '/calendar', to: 'static_pages#calendar'
  get '/next', to: 'static_pages#about'
  get '/raceresults/:id', to: 'static_pages#race_results',  as: 'results'
  # Defines the root path route ("/")
  # root "articles#index"
end
