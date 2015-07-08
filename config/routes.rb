Rails.application.routes.draw do

  get 'sessions/new'

  resources :topics do
  	resources :posts, except: [:index]
  end

  get 'new'  => 'users#new'
  resources :users

  get    'signin'   => 'sessions#new'
  post   'signin'   => 'sessions#create'
  delete 'signout'  => 'sessions#destroy'

  get 'about' => 'welcome#about'
  root to: 'welcome#index'
end
