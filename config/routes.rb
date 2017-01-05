Rails.application.routes.draw do
  resources :stories
  resource :app

  root to: 'app#index'
end
