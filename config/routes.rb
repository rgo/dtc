ActionController::Routing::Routes.draw do |map|

  map.resources :air_conditionings

  map.resources :cars

  map.resources :worktop_gas

  map.resources :worktop_inductions

  map.resources :fridges, :only => [:show, :index]

  map.resources :fridge_freezers

  map.resources :freezers

  map.resources :washing_machines
  
  map.resources :air_cons

  map.resources :dishwashers

  map.resources :dryers

  map.resources :ovens

  map.resources :washer_dryers
  
  map.resources :appliances, :only => [:show, :index], :collection => {:search => :get} 
  
  map.resources :sitemaps, :only => :index
  
  map.resources :public, :only => :index, :collection => {:search => :get, :about_us => :get}

  map.add_to_comparator 'add_to_comparator/:klass/:id', :controller => :comparator, :action => :add, :conditions => {:method => :get}
  map.remove_from_comparator 'remove_from_comparator/:klass/:id', :controller => :comparator, :action => :remove, :conditions => {:method => :get}
  map.comparator 'comparator/:klass', :controller => :comparator, :action => :index, :conditions => {:method => :get}
  map.compare 'compare/:klass', :controller => :comparator, :action => :compare, :conditions => {:method => :get}
#  map.compare 'comparator/:klass/:action/:id', :controller => :comparator, :member => {:add => :get, :remove => :get}, :collection => {:show => :get, :compare => :get}

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => "public"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
