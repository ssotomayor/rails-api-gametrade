Rails.application.routes.draw do
  match '/user/create', to: 'account#create_user', via: 'post'
  match '/user/signin', to: 'account#signin', via: 'post'
  match '/user/signout', to: 'account#signout', via: 'post'
  match '/user/add_game', to: 'account#add_game', via: [:get, :post]
  match '/user/modify/:modify', to: 'account#modify', via: [:get, :post]
  match '/user/:username', to: 'account#get_user_data', via: [:get, :post]

  match '/games/create', to: 'games#create', via: [:get, :post]
  match '/games/get_all', to: 'games#get_all', via: [:get, :post]
  match '/games/modify', to: 'games#update', via: [:get, :post]

  match '/device/create', to: 'device#create', via: [:get, :post]
  match '/device/get_all', to: 'device#read', via: [:get, :post]
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
