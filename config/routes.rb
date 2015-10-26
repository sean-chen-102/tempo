Rails.application.routes.draw do

  #resources :users
  #resources :interests
  #resources :custom_activities
  #resources :activities
  #resources :pages


  ### Custom Routing ###

  # Routes for the frontend
  get 'activities', to: 'activities#index'

  # match '*path', to: 'application#catch', via: [:get, :post, :put, :patch, :delete]

  # Users routing
  get '/api/users', to: 'users#get_users', defaults: { format: 'json' }
  get '/api/users/:id', to: 'users#get_user', defaults: { format: 'json' }
  get '/api/users/:id/interests', to: 'users#get_user_interests', defaults: { format: 'json' }
  get '/api/users/:id/custom_activities', to: 'users#get_user_custom_activities', defaults: { format: 'json' }
  post '/api/users/', to: 'users#create_user', defaults: { format: 'json' }
  post '/api/users/:id', to: 'users#edit_user', defaults: { format: 'json' }
  post 'api/users/:id/interests', to: 'users#set_interests_for_user', defaults: { format: 'json' }
  delete '/api/users/:id', to: 'users#destroy_user', defaults: { format: 'json' }

  # Interests routing 
  get '/api/interests', to: 'interests#get_interests', defaults: { format: 'json' }
  post '/api/interests', to: 'interests#create_interest', defaults: { format: 'json' }
  post '/api/interests/:id', to: 'interests#edit_interest', defaults: { format: 'json' }
  delete '/api/interests/:id', to: 'interests#destroy_interest', defaults: { format: 'json' }

  # Activities routing
  get '/api/activities', to: 'activities#get_activities', defaults: { format: 'json' }
  post '/api/activities', to: 'activities#create_activity', defaults: { format: 'json' }
  post '/api/activities/:id', to: 'activities#edit_activity', defaults: { format: 'json ' }
  delete '/api/activities/:id', to: 'activities#destroy_activity', defaults: { format: 'json' }

  # Custom Activities routing
  get '/api/custom_activities', to: 'custom_activities#get_custom_activities', defaults: { format: 'json' }
  post '/api/custom_activities', to: 'custom_activities#create_custom_activity', defaults: { format: 'json' }
  post '/api/custom_activities/:id', to: 'custom_activities#edit_custom_activity', defaults: { format: 'json ' }
  delete '/api/custom_activities/:id', to: 'custom_activities#destroy_custom_activity', defaults: { format: 'json' }

  # User Sessions routing
  post 'api/login', to: 'sessions#login', defaults: { format: 'json' }
  delete 'api/logout', to: 'sessions#logout', defaults: { format: 'json' }

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#home'

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
