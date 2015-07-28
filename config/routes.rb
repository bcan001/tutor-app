Rails.application.routes.draw do

  root 'schools#index'
  # resources :users

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'log_out'
  delete '/logout', to: 'sessions#destroy'

  get '/users/new', to: 'users#new', as: 'new_users'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'


  get '/users/:id/edit', to: 'users#edit', as: 'edit_profile'
  put '/users/:id', to: 'users#edit'
  patch '/users/:id', to: 'users#update'


  resources :schools do
    resources :courses do
      post '/favorite', to: 'favorites#create'
      resources :posts
    end
  end

  # get '/becometutor', to: 'is_tutors#new', as: 'new_tutor'
  # post '/becometutor', to: 'is_tutor#create'

  get '/myschools/:id', to: 'users#profile_schools', as: 'my_schools'
  get '/about', to: 'users#about', as: 'about'

  get '/allschools', to: 'schools#all_schools', as: 'all_schools'






  get '/users/:id/selectschool', to: 'user_schools#new', as: 'select_school'
  post '/users/:id/selectschool', to: 'user_schools#create', as: 'user_schools'
  delete '/users/:id', to: 'user_schools#destroy', as: 'destroy_school_assoc'
  get '/allusers', to: 'users#index', as: 'users_show'
  # post '/users/:friend_id/friendships', to: 'friendships#create', as: 'friendships'
  # delete '/users/:friend_id/friendships', to: 'friendships#destroy', as: 'destroy_friend'
  # patch '/users/:friend_id/friendships', to: 'friendships#accept_friend', as: 'accept_friendship'


  post '/users/:friend_id/friendships', to: 'friendships#create', as: 'friendships'
  delete '/users/:friend_id/friendships', to: 'friendships#destroy', as: 'destroy_friend'
  patch '/users/:friend_id/friendships', to: 'friendships#accept_friend', as: 'accept_friendship'


  



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
