Rails.application.routes.draw do
  
  resources :fav_jobs

  get 'jobsearch/jobs'
  get 'jobsearch/fav'
  resources :addresses
  resources :ims
  resources :phone_nos
  resources :educations
  resources :positions
  resources :full_profiles
  resources :fav_jobs
  resources :skills



  devise_for :users,:controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  get '/auth/linkedin' =>"linkedin#create"
  get 'linkedin/linkedin_profile'
  get '/oauth_account' => "linkedin#oauth_account"
  get '/linkedin_oauth_url' => 'linkedin#generate_linkedin_oauth_url'
  root :to => 'linkedin#index'

  scope "/linkedin" do
    resources :basic_profiles
  end

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
