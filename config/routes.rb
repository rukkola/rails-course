Rails.application.routes.draw do
  #get '/items', to: 'items#index'
  #post '/items', to: 'items#create'
  resources :items #, only: %i[index create]
end
