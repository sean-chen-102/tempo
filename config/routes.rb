Rails.application.routes.draw do

  ### Custom Routing ###

  # Routes for the frontend
  get 'tempo', to: 'tempo#index'

  # Users routing
  get '/api/users', to: 'users#get_all_users', defaults: { format: 'json' }
  get '/api/users/:id', to: 'users#get_user', defaults: { format: 'json' }
  get '/api/users/:id/interests', to: 'users#get_user_interests', defaults: { format: 'json' }
  get '/api/users/:id/custom_activities', to: 'users#get_user_custom_activities', defaults: { format: 'json' }
  get '/api/users/:id/completed_activities', to: 'users#get_completed_activities', defaults: { format: 'json' }
  get '/api/users/:id/completed_custom_activities', to: 'users#get_completed_custom_activities', defaults: { format: 'json' }
  post '/api/users/', to: 'users#create_user', defaults: { format: 'json' }
  post '/api/users/:id', to: 'users#edit_user', defaults: { format: 'json' }
  put 'api/users/:id/interests', to: 'users#set_interests_for_user', defaults: { format: 'json' }
  put '/api/users/:id/change_password', to: 'users#change_password', defaults: { format: 'json' }
  put '/api/users/:id', to: 'users#edit_user', defaults: { format: 'json' }
  delete '/api/users/:id', to: 'users#destroy_user', defaults: { format: 'json' }

  # Interests routing 
  get '/api/interests/:id', to: 'interests#get_interest', defaults: { format: 'json' }
  get '/api/interests', to: 'interests#get_all_interests', defaults: { format: 'json' }
  get '/api/interests/:id/users', to: 'interests#get_users_with_interest', defaults: { format: 'json' }
  post '/api/interests', to: 'interests#create_interest', defaults: { format: 'json' }
  put '/api/interests/:id', to: 'interests#edit_interest', defaults: { format: 'json' }
  delete '/api/interests/:id', to: 'interests#destroy_interest', defaults: { format: 'json' }

  # Activities routing
  get '/api/activities/:id', to: 'activities#get_activity', defaults: { format: 'json' }
  get '/api/activities', to: 'activities#get_all_activities', defaults: { format: 'json' }
  get '/api/activities/:id/interests', to: 'activities#get_interests_for_activity', defaults: { format: 'json' }
  get '/api/activities/:id/like_count', to: 'activities#get_like_count', defaults: { format: 'json' }
  post '/api/activities', to: 'activities#create_activity', defaults: { format: 'json' }
  put '/api/activities/:id', to: 'activities#edit_activity', defaults: { format: 'json' }
  put '/api/activities/:id/like', to: 'activities#like', defaults: { format: 'json' }
  put '/api/activities/:id/dislike', to: 'activities#dislike', defaults: { format: 'json' }
  put '/api/activities/:id/complete', to: 'activities#complete_activity', defaults: { format: 'json' }
  delete '/api/activities/:id', to: 'activities#destroy_activity', defaults: { format: 'json' }

  # Custom Activities routing
  get '/api/custom_activities', to: 'custom_activities#get_all_custom_activities', defaults: { format: 'json' }
  post '/api/users/:id/custom_activities', to: 'custom_activities#create_custom_activity', defaults: { format: 'json' }
  put '/api/users/:id/custom_activities/:cid', to: 'custom_activities#edit_custom_activity', defaults: { format: 'json' }
  put '/api/custom_activities/:id/complete', to: 'custom_activities#complete_custom_activity', defaults: { format: 'json' }
  delete '/api/users/:id/custom_activities/:cid', to: 'custom_activities#destroy_custom_activity', defaults: { format: 'json' }
  get '/api/users/:id/custom_activities/:cid', to: 'custom_activities#get_custom_activity', defaults: { format: 'json' }

  # User Sessions routing
  post 'api/login', to: 'sessions#login', defaults: { format: 'json' }
  delete 'api/logout', to: 'sessions#logout', defaults: { format: 'json' }
  get 'api/verify_token', to: 'sessions#verify_token', defaults: { format: 'json' }

  # Account Activations routing
  get 'api/users/:id/activate', to: 'account_activations#activate_account', defaults: { format: 'json' }

  # You can have the root of your site routed with "root"
  root 'tempo#index'

  # For 404 redirection
  get "*any", via: :all, to: "tempo#index"
  
end
