Rails.application.routes.draw do
  devise_for :users
  root 'exhibited_items#index'
  resources :exhibited_items do
    resources :purchases, only: [:index,:new,:create]
  end
end
