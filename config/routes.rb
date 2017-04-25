Rails.application.routes.draw do
  root to: "products#index"

  resources :merchants, except: [:new] do
    resources :products, except: [:index, :show]
  end

  resources :products, only: [:index, :show]
  resources :products do
    get 'orders/added_to_cart', to: 'orders#added_to_cart'
  end
  resources :orders, except: [:new]
  post '/products/:id/add_to_cart', to: 'orders#add_to_cart', as: 'add_to_cart'
  post '/products/:id/review', to: 'products#review', as: 'review'

  patch '/orders/:id/update_qty', to: 'orders#update_qty', as: 'update_quantity'
  # patch '/orders/:id/purchase', to: 'orders#purchase', as: 'purchase'
  # get '/orders/:id/payment', to: 'orders#payment', as: 'payment'
  delete '/orders/:order_id/orderproduct/:orderproduct_id', to: 'orders#destroy_orderproduct', as: 'delete_orderproduct'

  resources :reviews


  get "/auth/:provider/callback", to: "sessions#login"
  post '/login', to: 'sessions#login'
  post '/logout', to: 'sessions#logout', as: 'logout'
end
