Rails.application.routes.draw do
  resource :app, only: [:index]

  get '*path' => 'app#index' # Handle routing using react-router
  root to: 'app#index'
end
