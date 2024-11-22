Rails.application.routes.draw do
  get 'dashboard/index'
  devise_for :users
  root to: 'dashboard#index'
  
  get 'pages/about', as: 'about'
  get 'pages/how', as: 'how'
  
  # Route pour les erreurs 404
  match '/404', to: 'errors#not_found', via: :all
  
  # Rediriger toutes les autres routes non trouvées vers la page 404
  match '*path', to: 'errors#not_found', via: :all

   get 'dashboard', to: 'dashboard#index', as: 'dashboard'
end
