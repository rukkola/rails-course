Rails.application.routes.draw do
  #get '/items', to: 'items#index'
  #post '/items', to: 'items#create'
  resources :items do #, only: %i[index create]
    get :upvote, on: :member          # с id
    get :expensive, on: :collection   # без  id
  end
end
