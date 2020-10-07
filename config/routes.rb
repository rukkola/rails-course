Rails.application.routes.draw do
  devise_for :users
  #get '/items', to: 'items#index'
  #post '/items', to: 'items#create'

  root to: 'items#index'
  get '/admin/users_count', to: 'admin#users_count'

  resources :items do #, only: %i[index create]
    get :upvote, on: :member          # с id
    get :expensive, on: :collection   # без  id
  end
end
