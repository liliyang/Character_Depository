HelloWorld::Application.routes.draw do

  resources :clutches do
    resources :eggs
  end

  match 'characters/:character_id/relationships/edit' => 'relationships#edit', :as => 'edit_character_relationships', via: :get
    
  resources :characters do
    resources :dragons
    resources :pets
    resources :relationships
  end
  
  resources :users
  resources :sessions
  resources :searches
  resources :articles
  
  match 'welcome' => 'articles#welcome', :as => 'welcome', via: :get
  
  root to: 'articles#welcome'
  
  match 'character_groups/:character_type' => 'characters#index', :as => 'character_type', via: :get
  match 'recent_characters' => 'characters#new_created', :as => 'recent_characters', via: :get
  match 'updated_characters' => 'characters#new_updated', :as => 'updated_characters', via: :get
  match 'set_status/:id' => 'characters#set_status', :as => 'set_status', via: [:get, :put]
  match 'approve_character/:id' => 'characters#approve_character', :as => 'approve_character', via: [:get, :put]
  match 'characters/:id/upload_picture' => 'characters#upload_picture', :as => 'upload_picture', via: [:get, :post]
  
  match 'approve_clutch/:id' => 'clutches#approve_clutch', :as => 'approve_clutch', via: [:get, :put]
  
  match 'signup' => 'users#new', via: :get
  match 'signin' => 'sessions#new', via: :get
  match 'signout' => 'sessions#destroy', via: :delete
  match 'authenticate' => 'sessions#edit', via: :get
  
  match 'set_password/:id' => 'users#set_password', :as => 'set_password', via: [:get, :put]

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
