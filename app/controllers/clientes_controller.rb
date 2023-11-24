class ClientesController < ApplicationController
  before_action :set_cliente, only: [:edit, :update, :destroy, :show]

  def index
    @clientes = Cliente.new
  end

  def new
    @cliente = Cliente.new
  end

  def show
  end

  #ADICIONAR CLIENTE
  def adicionar_cliente
    @cliente = Cliente.new(cliente_par)
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

  #DELETE CLIENTE
  def destroy
    @cliente.destroy!
      respond_to do |format|
        format.html { redirect_to home_url, notice: "Cliente cancelado com sucesso..." }
        format.json { head :no_content }
    end
  end

  # PATCH/PUT
  def update
    respond_to do |format|
      if @cliente.update(cliente_params)
        format.html { redirect_to cliente_url, notice: "Cliente editado com sucesso..." }
        format.json { render :show, status: :ok, location: @cliente }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def cliente_params
    params.require(:cliente).permit(:Nome, :CPF, :Email, :Telefone, :Endereco)
  end

  def set_cliente
    @cliente = Cliente.find_by(params[:idClientes])
  end

  #Parametros para adicionar um cliente...
  def cliente_par
    params.permit(:Nome, :CPF, :Email, :Telefone, :Endereco)
  end

end
