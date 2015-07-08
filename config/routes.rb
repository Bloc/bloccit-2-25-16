Rails.application.routes.draw do

  get 'users/new'

  resources :topics do
  	resources :posts, except: [:index]
  end

  get 'about' => 'welcome#about'
  root to: 'welcome#index'
end
