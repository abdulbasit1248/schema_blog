Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      # resources :contacts
      # resources :sessions, only: [:create, :destroy]
      # resources :profiles, only: [:create, :show]
      resource :profile, only: [:create, :show]
      resource :session, only: [:create]
      resources :blogs, only: [:create, :show, :index, :update]
    end
  end
end