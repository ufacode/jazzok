Rails.application.routes.draw do
  root "posts#index"
  resources :categories
  resources :posts
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
  mount Commontator::Engine => '/commontator'
end
