Rails.application.routes.draw do
  post '/login', to: 'login#login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :items, only: [:index, :show, :create, :update, :destroy] do
        resources :orders, only: [:create]
        collection do
          get "renting", to: "items#renting"
          get "rentingout", to: "items#rentingout"
        end
      end
    end
  end

  # resources :users, only: [:show] do
  #   resources :items, only: [:index] do
  #   end
  # end
end
