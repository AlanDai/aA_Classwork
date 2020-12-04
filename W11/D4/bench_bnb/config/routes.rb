Rails.application.routes.draw do
  get 'session/create'
  get 'session/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "static_pages#root";

end
