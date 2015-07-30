Rails.application.routes.draw do
  resources :topics do
    resources :posts, except: [:index]
  end

  # resources :topics
  # resources :posts

  get 'about' => 'welcome#about'
  root to: 'welcome#index'
end
