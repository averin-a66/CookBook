Rails.application.routes.draw do
  root 'states#index', as: 'home'

  get 'about' => 'pages#about'

  resources :unit_systems
  resources :states
  resources :units
  resources :unit_kinds
  resources :unit_converts

end
