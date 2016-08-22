Rails.application.routes.draw do

  root 'categories#index'

  resources :users
  resources :categories, only: [:index, :new, :create, :show, :destroy] do
    resources :articles, except: :index
  end


  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end
