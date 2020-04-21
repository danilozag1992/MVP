Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  resources :groups
  resources :practices
  get  '/not_group', to: 'practices#not_group'
  get 'search', to:"practices#search", :as => 'search_page'

end
