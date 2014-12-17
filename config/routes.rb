Hondana::Application.routes.draw do
  devise_for :members
  resources :members

  resources :bookgenres

  root to: "top#index"
  match 'top' => 'top#index', via: [ :get, :post, :patch ]
  match 'top/index' => 'top#index', via: [ :get, :post, :patch ]

  match 'account' => 'account#index', via: [ :get, :post, :patch ]
  match 'account/index' => 'account#index', via: [ :get, :post, :patch ]

  match 'account/profile' => 'profile#index', via: [ :get, :post, :patch ]
  match 'account/profile/index' => 'profile#index', via: [ :get, :post, :patch ]
  match 'account/profile/edit' => 'profile#edit', via: [ :get, :post, :patch ]
  match 'account/profile/comp' => 'profile#comp', via: [ :get, :post, :patch ]

  match 'trade' => 'trade#index', via: [ :get, :post, :patch ]
  match 'trade/index' => 'trade#index', via: [ :get, :post, :patch ]

  match 'information/outline/service' => 'service#index', via: [ :get, :post, :patch ]
  match 'information/outline/service/index' => 'service#index', via: [ :get, :post, :patch ]

  match 'information/members/notice' => 'members#notice', via: [ :get, :post, :patch ]

  match 'search' => 'search#index', via: [ :get, :post, :patch ]
  match 'search/index' => 'search#details', via: [ :get, :post, :patch ]
  match 'search/details/' => 'search#details', via: [ :get, :post, :patch ]

  #get : "top/index"

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
