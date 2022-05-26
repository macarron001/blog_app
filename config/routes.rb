Rails.application.routes.draw do
  resources :comments
 root "articles#index"
 
 resources :articles
end
