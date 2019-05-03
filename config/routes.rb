Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bloggers, only: %i[new create show]
  resources :posts, only: %i[new create edit update show index]
  resources :destinations, only: %i[show]

  get 'posts/:id/like', to: 'posts#like', as: 'like_post'

  get '/', to: 'posts#index'
end
