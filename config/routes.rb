Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: "pages#index"
  get 'pages/about', as: 'about'
  get 'pages/how', as: 'how'
  get 'dashboard/index', to: 'dashboard#index', as: 'dashboard_index'

  # Pet Routes
  get 'profile', to: 'pets#profile', as: :profile
  get 'hygiene', to: 'pets#hygiene', as: :hygiene
  get 'nutrition', to: 'pets#nutrition', as: :nutrition
  get 'activities', to: 'pets#activities', as: :activities

  # Routes pour les vétérinaires
  resources :vets do
    resources :vet_appointments, shallow: true
  end

  # Routes imbriquées pour les pets et leurs données associées
  resources :pets do
    get 'calendar', on: :member  
    resources :treatments
    resources :measurements
    resources :activities, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :hygienes # Ajout des routes pour les hygienes
  end


  # Route pour les erreurs 404
  match '/404', to: 'errors#not_found', via: :all

  # Rediriger toutes les autres routes non trouvées vers la page 404
  match '*path', to: 'errors#not_found', via: :all
end
