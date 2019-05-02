Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bloggers, only: %i[new create show]
  resources :posts, only: %i[new create edit update show]
  resources :destinations, only: %i[show]
end
