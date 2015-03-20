Rails.application.routes.draw do

  match 'search' => 'common#search', via: [:get, :post]

  match 'mobs.html' => 'mobs#index', via: [:get, :post]
  get 'mobs/:id.html' => 'mobs#view'

  match 'cards.html'  => 'items#index', type: 'cards', via: [:get, :post]
  match 'armor.html'  => 'items#index', type: 'armor', via: [:get, :post]
  match 'weapon.html' => 'items#index', type: 'weapon', via: [:get, :post]
  match 'usable.html' => 'items#index', type: 'usable', via: [:get, :post]
  match 'ext.html'    => 'items#index', type: 'ext', via: [:get, :post]
  get 'items/:id.html' => 'items#view'

  match 'maps.html' => 'maps#index', via: [:get, :post]
  get 'maps/:id.html' => 'maps#view'

  #match 'npc.html' => 'npcs#index', via: [:get, :post]
  get 'npc/:id.html' => 'npcs#view'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'common#index'

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
