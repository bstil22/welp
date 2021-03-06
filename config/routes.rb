Rails.application.routes.draw do
  get '/sign-up' => 'registrations#new', as: :signup
  post '/sign-up' => 'registrations#create'
  get '/sign-in' => 'authentication#new', as: :signin
  post '/sign-in' => 'authentication#create'
  get '/sign-out' => 'authentication#destroy', as: :signout

  resources :users
  resources :restaurants do
    resources :reviews
  end
  
  root  'welcome#index'
  get '/coordinates' => 'welcome#coordinates'
  get '/results' => 'welcome#results'
  get '/search' => 'welcome#search'
end
  