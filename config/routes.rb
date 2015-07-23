Rails.application.routes.draw do

  resources :topics do
  	resources :posts, except: [:index]
  end

  resources :users, only: [:show, :new, :create]

  get    'sign_in'   => 'sessions#new'
  post   'sign_in'   => 'sessions#create'
  delete 'sign_out'  => 'sessions#destroy'

  get 'about' => 'welcome#about'
  root to: 'welcome#index'
end
