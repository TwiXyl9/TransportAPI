Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :capacity
      resources :cars
      resources :services
    end
  end
end
