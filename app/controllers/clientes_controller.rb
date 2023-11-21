class ClientesController < ApplicationController
  def index
    @clientes = Cliente.new
  end

  def new
    @cliente = Cliente.new
  end

  def adicionar_cliente
    @cliente = Cliente.new(cliente_params)
    begin
      if @cliente.save
        flash[:notice] = "Cliente adicionado com sucesso"
        redirect_to action: 'index'
      else
        flash[:notice] = "Erro ao adicionar cliente"
        redirect_to action: 'index'
      end
    rescue StandardError => e
      flash[:notice] = "Erro ao adicionar cliente"
      redirect_to action: 'index'
    end
  end

  private

  def cliente_params
    params.permit(:Nome, :CPF, :Email, :Telefone, :Endereco)
  end
end
