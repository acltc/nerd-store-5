Rails.application.routes.draw do
  delete '/carted_products/:id' => 'carted_products#destroy'
  post '/carted_products' => 'carted_products#create'
  get '/carted_products' => 'carted_products#index'
  post '/orders' => 'orders#create'
  get '/orders/:id' => 'orders#show'
  get "/signup" => "users#new"
  post "/users" => "users#create"
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"
  get '/' => 'products#index'
  get '/products' => 'products#index'
  get '/products/new' => 'products#new'
  post '/products' => 'products#create'
  get '/products/:id' => 'products#show'
  get '/products/:id/edit' => 'products#edit'
  patch '/products/:id' => 'products#update'
  delete '/products/:id' => 'products#destroy'
  get '/images/new' => 'images#new'
  post '/images' => 'images#create'
end
