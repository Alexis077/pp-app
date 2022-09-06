Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :authentications, only: [:login] do 
        collection do 
          post 'login', to: 'authentications#login'
        end
      end
      resources :products, only: [:most_demanded, :top_incomes] do 
        collection do
          get 'most_demanded', to: 'products#most_demanded'
          get 'top_incomes', to: 'products#top_incomes'
        end
      end
      resources :purchases, only: [:index]
    end
  end
end
