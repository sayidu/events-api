Rails.application.routes.draw do
  namespace :api do
    resource :auth, only: :create, controller: 'auth'
    resource :users
    resources :events do
      resources :attendees
    end
  end
end
