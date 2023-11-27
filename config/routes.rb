Rails.application.routes.draw do
  get 'veiculos/index'
  get 'veiculos/show'
  get 'home/index'
  get 'home/show'
  get 'mecanicos/index', to: 'mecanicos#index'
  get 'clientes/index'
  get 'pecas/index'
  get 'login/index'
  get 'login/esqueceu_senha'
  post 'login/esqueceu_senha'
  get 'login/trocar_senha'
  put 'login/trocar_senha'
  get 'pecas/new', to: 'pecas#new'
  post 'pecas/adicionar_peca', to: 'pecas#adicionar_peca'
  get 'clientes/new', to: 'clientes#new'
  post 'clientes/adicionar_cliente', to: 'clientes#adicionar_cliente'
  get 'mecanicos/new', to: 'mecanicos#new'
  get 'mecanicos/adicionar_mecanico', to: 'mecanicos#adicionar_mecanico'
  post 'mecanicos/adicionar_mecanico', to: 'mecanicos#adicionar_mecanico'
  post 'veiculos/create', to: 'veiculos#create'
  post 'veiculos/adicionar_veiculo', to: 'veiculos#adicionar_veiculo'
  resources :veiculos
  resources :pecas
  resources :clientes
  resources :mecanicos
  resources :home
  # devise_for :admins
  #get 'boas_vinda/index'
  resources :admins #Cria as rotas para o controller admins GET, POST, PUT, DELETE
  get "up" => "rails/health#show", as: :rails_health_check
  get 'login/index'
  post 'login/login'
  get 'login/logout'
  root 'home#index'
end
