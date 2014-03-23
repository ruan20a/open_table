# == Route Map (Updated 2014-03-17 23:56)
#
#                    Prefix Verb   URI Pattern                     Controller#Action
#         new_owner_session GET    /owners/sign_in(.:format)       owners/sessions#new
#             owner_session POST   /owners/sign_in(.:format)       owners/sessions#create
#     destroy_owner_session DELETE /owners/sign_out(.:format)      owners/sessions#destroy
#            owner_password POST   /owners/password(.:format)      owners/passwords#create
#        new_owner_password GET    /owners/password/new(.:format)  owners/passwords#new
#       edit_owner_password GET    /owners/password/edit(.:format) owners/passwords#edit
#                           PATCH  /owners/password(.:format)      owners/passwords#update
#                           PUT    /owners/password(.:format)      owners/passwords#update
# cancel_owner_registration GET    /owners/cancel(.:format)        owners/registrations#cancel
#        owner_registration POST   /owners(.:format)               owners/registrations#create
#    new_owner_registration GET    /owners/sign_up(.:format)       owners/registrations#new
#   edit_owner_registration GET    /owners/edit(.:format)          owners/registrations#edit
#                           PATCH  /owners(.:format)               owners/registrations#update
#                           PUT    /owners(.:format)               owners/registrations#update
#                           DELETE /owners(.:format)               owners/registrations#destroy
#                      root GET    /                               restaurants#index
#               restaurants GET    /restaurants(.:format)          restaurants#index
#                           POST   /restaurants(.:format)          restaurants#create
#            new_restaurant GET    /restaurants/new(.:format)      restaurants#new
#           edit_restaurant GET    /restaurants/:id/edit(.:format) restaurants#edit
#                restaurant GET    /restaurants/:id(.:format)      restaurants#show
#                           PATCH  /restaurants/:id(.:format)      restaurants#update
#                           PUT    /restaurants/:id(.:format)      restaurants#update
#                           DELETE /restaurants/:id(.:format)      restaurants#destroy
#                    owners GET    /owners(.:format)               owners#index
#                           POST   /owners(.:format)               owners#create
#                 new_owner GET    /owners/new(.:format)           owners#new
#                edit_owner GET    /owners/:id/edit(.:format)      owners#edit
#                     owner GET    /owners/:id(.:format)           owners#show
#                           PATCH  /owners/:id(.:format)           owners#update
#                           PUT    /owners/:id(.:format)           owners#update
#                           DELETE /owners/:id(.:format)           owners#destroy
#                   sign_in GET    /sign_in(.:format)              owners/sessions#new
#                   sign_up GET    /sign_up(.:format)              owners/registrations#new
#                    logout GET    /logout(.:format)               owners/sessions#destroy
#                     login GET    /login(.:format)                session#new
#                           POST   /login(.:format)                session#create
#                           GET    /logout(.:format)               session#destroy
#

OpenTable::Application.routes.draw do

  devise_for :owners, controllers: {registrations: "owners/registrations", passwords: "owners/passwords", sessions: "owners/sessions"}
  root :to => "restaurants#index"

  resources :restaurants
  resources :owners
  resources :reservations
  #configure routes
  devise_scope :owner do
    get "sign_in", to: "owners/sessions#new"
    get "sign_up", to: "owners/registrations#new"
    get "logout", to: "owners/sessions#destroy"
  end


  get "/login" => "session#new"
  post "/login" => "session#create"
  get "/logout" => "session#destroy"
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
