class VeiculosController < ApplicationController
  def index
    @veiculos = Veiculo.all
    @clientes = Cliente.all
  end

  def show
  end

  def edit
  end

  def new
    @veiculos = Veiculo.new
    @clientes = Cliente.all
  end

  def adicionar_veiculo
    @veiculos = Veiculo.new(veiculo_par)
    if @veiculos.save
      flash[:notice] = "Veiculo adicionado com sucesso"
      redirect_to action: 'index'
    else
      flash[:notice] = "Erro ao adicionar veiculo"
      redirect_to action: 'new'
    end
  end

  def veiculo_par
    params.permit(:Placa, :Ano, :Cor, :Modelo, :Clientes_idClientes)
  end
end
