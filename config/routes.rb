Rails.application.routes.draw do
  devise_for :users
  ActiveAdmin.routes(self)
  mount RedactorRails::Engine => '/redactor_rails'
  #, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  devise_scope :user do
    get "/sign_in" => "devise/sessions#new" # custom path to login/sign_in
    get "/admin/sign_out", to: "devise/sessions#destroy", as: :logout_admin
  end

  root to: "articles#index"

  #FIXME
  resources :comments
  #FIXME
  get 'tag/:tag', to: 'articles#show_by_tag', as: :tag

  get 'articles/search', to: 'articles#search'
  resources :articles, only: [:index, :show, :new, :create, :update, :destroy]

  get 'rate', to: 'users_ratings#update', as: :rate

  # resources :comments, only: [:create, :update, :destroy]

  # show articles by category



  get 'users/search', to: 'users#index', as: :users
  get 'users/:id/subscribe', to: 'users#subscribe', as: :user_subscribe
  get 'users/:id/unsubscribe', to: 'users#unsubscribe', as: :user_unsubscribe

 	get 'info', to: 'pages#info'
  get 'price', to: 'pages#price'
  get 'trainers', to: 'pages#trainers'

  get 'auth/vkontakte/callback', to: 'omniauth#create'


  resources :constructor_trainings, only: [:index, :new, :show] do
    member do
      post 'add/:exercise_id', to: 'constructor_trainings#add_exercise', as: :add_exercise
      post 'remove/:exercise_id', to: 'constructor_trainings#remove_exercise', as: :remove_exercise
    end
  end
  resources :recordings_trainings, only: [:new, :create]
  resources :applications_training_programs, only: [:new, :create]




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
