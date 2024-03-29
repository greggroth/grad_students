GradStudents::Application.routes.draw do
  get "letter/show"

  devise_for :professors
  
  root to: "students#index"
  
  match 'students/incomplete_qualifier' => 'students#incomplete_qualifier'
  match 'students/incomplete_research' => 'students#incomplete_research'
  match 'students/incomplete_citi' => 'students#incomplete_citi'
  match 'students/committees' => 'students#committees'
  match 'students/funding' => 'students#funding'
  match 'professors/committees' => 'professors#committees'
  match 'fundings/edit' => 'fundings#edit', as: :edit_fundings
  match 'fundings/update' => 'fundings#update', as: :update_fundings, via: :put
  resources :professors
  resources :students
  resources :meetings
  resources :letters
  
  
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
