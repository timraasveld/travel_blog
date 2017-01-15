Rails.application.routes.draw do
  resource :app

  root to: 'app#index'
end
