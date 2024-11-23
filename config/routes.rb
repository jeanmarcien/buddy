Rails.application.routes.draw do
  get 'dashboard/index'
  devise_for :users, controllers: { sessions: 'users/sessions' }
  
  authenticated :user do
    root to: 'dashboard#index', as: :authenticated_root
  end
  root to: "pages#index"

  get 'pages/about', as: 'about'
  get 'pages/how', as: 'how'

  # Route pour les erreurs 404
  match '/404', to: 'errors#not_found', via: :all

  # Rediriger toutes les autres routes non trouvées vers la page 404
  match '*path', to: 'errors#not_found', via: :all

  resources :pets # Add this line to define routes for pets

  get 'dashboard', to: 'dashboard#index', as: 'dashboard'
end