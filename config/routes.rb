WinTools::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  root :to => "products#index"
  match "products" => "products#index", :via => :get, :as => "products"
  match "products/:id" => "products#show", :via => :get, :as => "product"
  match "products/category/:id" => "products#products_by_category", :via => :get, :as => "products_by_category"
  match "search" => "search#search", :via => :get, :as => "search"
  match "search_results" => "search#search_results", :via => :post, :as => "search_results"
  match "cart" => "products#cart", :via => :get, :as => "cart"
  match "add_to_cart/:id" => "products#add_to_cart", :via => :get, :as => "add_to_cart"
  match "remove_from_cart/:id" => "products#remove_from_cart", :via => :get, :as => "remove_from_cart"
  match "change_quantity" => "products#change_quantity", :via => :post, :as => "change_quantity"
  match "clear_cart" => "products#clear_cart", :via => :get, :as => "clear_cart"
  match "checkout" => "products#checkout", :via => :get, :as => "checkout"
  match "user_credentials" => "customers#user_credentials", :via => :get, :as => "user_credentials"
  match "create" => "customers#create", :via => :post, :as => "create"
  match "order" => "products#order", :via => :post, :as => "order"
  match "confirmation" => "products#confirmation", :via => :post, :as => "confirmation"
  
  ActiveAdmin.routes(self)

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
