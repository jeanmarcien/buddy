Rails.application.routes.draw do
  devise_for :users
  root to: "pages#index"
  get 'pages/about', as: 'about'
  get 'pages/how', as: 'how'
end
