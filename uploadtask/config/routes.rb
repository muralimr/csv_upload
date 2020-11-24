Rails.application.routes.draw do
  # get 'news/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :product

  root "product#index"
  
  get 'get_products', to: 'product#get_products'

  resources :news

  get 'get_api_data', to: 'news#get_api_data'
  
end
