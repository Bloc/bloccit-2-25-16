Rails.application.routes.draw do

  resources :topics do
  	resources :posts, except: [:index]
  end


  resources :users

  get 'new'  => 'users#new'

  get 'sessions/new'
  get    'signin'   => 'sessions#new'
  post   'signin'   => 'sessions#create'
  delete 'signout'  => 'sessions#destroy'

  get 'about' => 'welcome#about'
  root to: 'welcome#index'
end
