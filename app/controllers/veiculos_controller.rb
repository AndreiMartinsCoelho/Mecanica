class VeiculosController < ApplicationController
  before_action :set_veiculo, only: %i[edit update destroy show]

  def index
    @veiculo = Veiculo.all
    @clientes = Cliente.all
  end

  def show
  end

  def edit
  end

  def new
    @veiculo = Veiculo.new
    @clientes = Cliente.all
  end

  #ADICIONAR VEICULORa
  def adicionar_veiculo
    @veiculo = Veiculo.new(veiculo_par)
    if @veiculo.save
      flash[:notice] = "Veiculo adicionado com sucesso"
      redirect_to action: 'index'
    else
      flash[:notice] = "Erro ao adicionar veiculo"
      redirect_to action: 'new'
    end
  end

    #DELETE VEICULO
    def destroy
      @veiculo.destroy!
      respond_to do |format|
        format.html { redirect_to '/', notice: "Veiculo cancelado com sucesso..." }
        format.json { head :no_content }
      end
    end

    # PATCH/PUT
    def update
      respond_to do |format|
        if @veiculo.update(veiculo_params)
          format.html { redirect_to veiculo_url(@veiculo), notice: "Veiculo editado com sucesso..." }
          format.json { render :show, status: :ok, location: @veiculo }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @veiculo.errors, status: :unprocessable_entity }
          #flash[:notice] = "Erro ao editar a mecanico..."
        end
      end
    end

  private
  def veiculo_par
    params.permit(:Placa, :Ano, :Cor, :Modelo, :Clientes_idClientes)
  end

  def veiculo_params
    params.require(:veiculo).permit(:Placa, :Ano, :Cor, :Modelo, :Clientes_idClientes)
  end

  def set_veiculo
    @veiculo = Veiculo.find(params[:id])
  end

end
