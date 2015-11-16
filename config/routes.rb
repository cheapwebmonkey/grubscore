Rails.application.routes.draw do

  get "/login" => "user_sessions#new", as: :login
  # get "/business" =>"business#edit", as: :edit
  delete "/logout" => "user_sessions#destroy", as: :logout
  
  resources :users
  resources :user_sessions, only: [:new, :create]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :lou_inspections
  resources :lou_violations

  # resources :lou_violations
  resources :businesses 
  resources :businesses do
    resources :lou_inspections, :lou_violations do
      member do
        patch :complete
      end
    end
  end
  root 'businesses#index'

 resources :users do
    # resources :lou_inspections do
    #   member do
    #     patch :complete
    #   end
    # end
  end
  #this sets the app root path to the /users/new sign up page
  # root 'users#new'

  
  # resources :businesses do
  #   resources :lou_inspections do
  #     member do
  #       patch :complete
  #     end
  #   end
  # end
  # root 'businesses#index'
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

  
  
#   resources :businesses do
#   collection { post :import }
# end
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
