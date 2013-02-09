Scp::Application.routes.draw do

  resources :cargo_categorias


  resources :tipo_contratos


  resources :perfis
  resources :contratos
  resources :tipocontratos
  resources :categorias
  resources :lotacoes
  resources :cargocategorias
  resources :vagas
  resources :leis
  resources :orgaos
  resources :contratacoes
  resources :pessoas
  resources :cargos
  resources :indicadores
  resources :partidos


  root :to => "inicio#index"

  devise_for :usuarios, 

            :path => "usuarios",
            :path_names => { :sign_in => 'login',
                             :sign_out => 'logout', 
                             :password => 'secret', 
                             :confirmation => 'verification', 
                             :unlock => 'unblock', 
                             :registration => 'register', 
                             :sign_up => 'cmon_let_me_in' 
                           },
            :controllers => { :registrations => 'registrations'}


  
  devise_scope :usuario do
    get "sign_in", :to => "devise/sessions#new", :as => 'sign_in'
  end

  resources :inicio
  resources :usuarios

  match 'lotacoes/new/:parent_id'           => 'lotacoes#new'

  match 'get_categoria_valor' => 'categorias#get_valor'

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
