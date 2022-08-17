Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/', to: 'static_pages#home'
  get '/constructor_standings', to: 'static_pages#constructors'
  get '/calendar', to: 'static_pages#calendar'
  get '/next', to: 'static_pages#about'
  get '/news', to: 'static_pages#news'
  get '/raceresults/:id', to: 'static_pages#race_results',  as: 'results'
  get '/full_standings', to: 'static_pages#full_standings',  as: 'full_standings'
  get '/historical_data/:year', to: 'static_pages#historical_data',  as: 'historical_data'
  # Defines the root path route ("/")
  # root "articles#index"
end
