Ecm::Comments::Backend::Engine.routes.draw do
  resources :comments

  root to: 'home#index'
end