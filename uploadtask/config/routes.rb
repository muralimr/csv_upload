Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :product

  root "product#index"
  
  get 'get_products', to: 'product#get_products';
end
