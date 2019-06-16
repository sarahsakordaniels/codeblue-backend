Rails.application.routes.draw do
  resources :items
  resources :rhythms
  resources :codemedications
  resources :shocks
  resources :vitalsets
  resources :codes
  resources :medications
  resources :patients
  resources :users
  post 'authenticate', to: "authentication#authenticate"
end
