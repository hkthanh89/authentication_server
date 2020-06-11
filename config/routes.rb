Rails.application.routes.draw do
  post 'auth/login'
  get 'auth/verify'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:create]
end
