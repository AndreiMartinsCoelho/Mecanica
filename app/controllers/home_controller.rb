class HomeController < ApplicationController
  def index
    @pecas = Peca.all
    @mecanicos = Mecanico.all
    @veiculos = Veiculo.all
    @clientes = Cliente.all
    @equipes = Equipe.all
  end

  def show
    @peca = Peca.find(params[:idPecas])
    @mecanico = Mecanico.find(params[:idMecanicos])
    @veiculo = Veiculo.find(params[:idVeiculos])
    @cliente = Cliente.find(params[:idClientes])
    @equipe = Equipe.find(params[:idEquipes])
  end
end
