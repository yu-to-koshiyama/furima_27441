Rails.application.routes.draw do
  root 'exhibited_items#index'
  resources :exhibited_items
end
