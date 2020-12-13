Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'recipes#index', as: 'home'

  get 'about' => 'pages#about'

  resources :unit_systems
  resources :states
  resources :units
  resources :unit_kinds
  resources :unit_converts
  resources :recipes do
    resources :coments
    resources :ingredients
  end
end
