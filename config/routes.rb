Hondana::Application.routes.draw do
  resources :books
  resources :bookinfos
  resources :favorite_authors
  get "favorite_authors/update"
  get "favorite_authors/new"
  get "favorite_authors/show"
  resources :members
  resources :sessions, only: [:new, :create, :destroy]
  resources :bookgenres
  resources :password_new

  root to: "top#index"

  match '/signup',  to: 'members#new',          via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'get'
  match 'top' => 'top#index', via: [ :get, :post, :patch ]
  match 'top/index' => 'top#index', via: [ :get, :post, :patch ]

  match 'user/:id' => 'user#index', via: [ :get, :post, :patch ]

  match 'account' => 'account#index', via: [ :get, :post, :patch ]
  match 'account/index' => 'account#index', via: [ :get, :post, :patch ]

  match 'account/collection' => 'collection#index', via: [ :get, :post, :patch ]
  match 'account/collection/index' => 'collection#index', via: [ :get, :post, :patch ]
  match 'account/collection/edit/:id' => 'collection#edit', via: [ :get, :post, :patch ]
  match 'account/collection/confirm' => 'collection#confirm', via: [ :get, :post, :patch ]
  match 'account/collection/comp' => 'collection#comp', via: [ :get, :post, :patch ]
  match 'account/profile' => 'profile#index', via: [ :get, :post, :patch ]
  match 'account/profile/index' => 'profile#index', via: [ :get, :post, :patch ]
  match 'account/profile/edit' => 'profile#edit', via: [ :get, :post, :patch ]
  match 'account/profile/confirm' => 'profile#confirm', via: [ :get, :post, :patch ]
  match 'account/profile/comp' => 'profile#comp', via: [ :get, :post, :patch ]
  match 'account/profile/leave' => 'profire#leave', via: [ :get, :post, :patch ]
  match 'account/profile/leave/index' => 'leave#index', via: [ :get, :post, :patch ]
  match 'account/profile/leave/success' => 'leave#success', via: [ :get, :post, :patch ]

  match 'pw_forget/index' => 'pw_forget#index',via: [ :get, :post, :patch ]
  match 'pw_forget/comp' => 'pw_forget#comp',via: [ :get, :post, :patch ]

  match 'password_new/new' => 'password_new#new',via: [ :get, :post, :patch ]
  match 'password_new/comp' => 'password_new#comp',via: [ :get, :post, :patch ]

  match 'trade' => 'trade#index', via: [ :get, :post, :patch ]
  match 'trade/index' => 'trade#index', via: [ :get, :post, :patch ]

  match 'trade/:id/select' => 'trade#select', via: [ :get, :post, :patch ]
  match 'trade/:idb/:idm/confirm' => 'trade#confirm', via: [ :get, :post, :patch ]
  match 'trade/:idb/:idm/details' => 'trade#details', via: [ :get, :post, :patch ]
#--------------------------------------------------------------------------------
  match 'trade/:idb/:idm/comp' => 'trade#comp', via: [ :get, :post, :patch ]
#--------------------------------------------------------------------------------

  match 'information/guide' => 'guide#index', via: [ :get, :post, :patch ]
  match 'information/guide/index' => 'guide#index', via: [ :get, :post, :patch ]

  match 'information/fee' => 'fee#index', via: [ :get, :post, :patch ]
  match 'information/fee/index' => 'fee#index', via: [ :get, :post, :patch ]

  match 'information/news' => 'news#index', via: [ :get, :post, :patch ]
  match 'information/news/index' => 'news#index', via: [ :get, :post, :patch ]

  match 'information/terms' => 'terms#index', via: [ :get, :post, :patch ]
  match 'information/terms/index' => 'terms#index', via: [ :get, :post, :patch ]

  match 'information/outline/service' => 'service#index', via: [ :get, :post, :patch ]
  match 'information/outline/service/index' => 'service#index', via: [ :get, :post, :patch ]

  match 'information/outline/corporation' => 'corporation#index', via: [ :get, :post, :patch ]
  match 'information/outline/corporation/index' => 'corporation#index', via: [ :get, :post, :patch ]

  match 'information/members/notice' => 'members#notice', via: [ :get, :post, :patch ]

  match 'search' => 'search#index', via: [ :get, :post, :patch ]
  match 'search/index' => 'search#index', via: [ :get, :post, :patch ]
  match 'search/details' => 'search#details', via: [ :get, :post, :patch ]
  match 'search/:id/details' => 'search#book_details', via: [ :get, :post, :patch ]
  match 'search/addbook' => 'addbook#index', via: [ :get, :post, :patch ]
  match 'search/addbook/index' => 'addbook#index', via: [ :get, :post, :patch ]
  match 'search/addbook/confirm' => 'addbook#confirm', via: [ :get, :post, :patch ]
  match 'search/addbook/comp' => 'addbook#comp', via: [ :get, :post, :patch ]

  match 'support/inquiry' => 'inquiry#index', via: [ :get, :post, :patch ]
  match 'support/inquiry/index' => 'inquiry#index', via: [ :get, :post, :patch ]
  match 'support/inquiry/confirm' => 'inquiry#confirm', via: [ :get, :post, :patch ]
  match 'support/inquiry/comp' => 'inquiry#comp', via: [ :get, :post, :patch ]



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
