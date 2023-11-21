Rails.application.routes.draw do
  get 'login/index'
  get 'login/esqueceu_senha'
  post 'login/esqueceu_senha'
  get 'login/trocar_senha'
  put 'login/trocar_senha'
  # devise_for :admins
  #get 'boas_vinda/index'
  resources :admins #Cria as rotas para o controller admins GET, POST, PUT, DELETE
  get "up" => "rails/health#show", as: :rails_health_check
  get 'login/index'
  post 'login/login'
  get 'login/logout'
  root to: "boas_vinda#index"
end
