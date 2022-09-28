Rails.application.routes.draw do
  namespace :api do
    resource :auth, only: :create, controller: 'auth'
    resource :users
    resources :events
  end
end
