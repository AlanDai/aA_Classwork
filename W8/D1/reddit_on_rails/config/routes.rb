Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :edit, :update, :destroy] 
  resource :session, only: [:new, :create, :destroy]

  resources :subs

  post '/posts/new', to: 'posts#new', as: 'new_post'
  
  resources :posts, except: [:index, :new] do
    resources :subs, only: [:show] 
  end
end