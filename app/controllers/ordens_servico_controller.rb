class OrdensServicoController < ApplicationController
  before_action :set_ordem_servico, only: %i[edit update destroy show]

  def index
    @ordens_servico = OrdensServico.all
    @veiculos = Veiculo.all
    @clientes = Cliente.all
    @equipes = Equipe.all
    @pecas = Peca.all
    @mecanicos = Mecanico.all
  end

  def show
  end

  def new
    @ordens_servico = OrdensServico.new
    @veiculos = Veiculo.all
    @clientes = Cliente.all
    @equipes = Equipe.all
    @pecas = Peca.all
    @mecanicos = Mecanico.all
  end

  def edit
  end

  # ADICIONAR EQUIPE
  def create
    @ordens_servico = OrdensServico.new(ordens_servico_par)

    if @ordens_servico.save
      flash[:notice] = "Ordem de serviço adicionada com sucesso"
      redirect_to '/'
    else
      flash[:notice] = @ordens_servico.errors.full_messages.join(", ")
      redirect_to '/ordens_servico'
    end
    rescue StandardError => e
    flash[:notice] = "Erro ao adicionar ordem de serviço"
    redirect_to '/ordens_servico'
  end

  # UPDATE EQUIPE
  def update
    respond_to do |format|
      if @ordens_servico.update(ordens_servico_par)
        format.html { redirect_to ordens_servico_url(@ordens_servico), notice: "Ordem de serviço editada com sucesso..." }
        format.json { render :show, status: :ok, location: @ordens_servico }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ordens_servico.errors, status: :unprocessable_entity }
      end
    end
  end

  # CANCELAR ORDEM DE SERVIÇO
  def destroy
    @ordens_servico.destroy!
    respond_to do |format|
      format.html { redirect_to '/', notice: "Ordem de serviço cancelada com sucesso..." }
      format.json { head :no_content }
    end
  end

  private
  def ordens_servico_par
    params.require(:ordens_servico).permit(:Data_emissao, :Data_conclusao, :Valor, :Mao_obra, :Servico_descricao, :Status, :Equipes_idEquipes, :Veiculos_idVeiculos, :Clientes_idClientes, peca_ids: [])
  end

  def add_peca
    @ordens_servico = OrdensServico.find(params[:id])
    @peca = Peca.find(params[:peca_id])
    @ordens_servico.pecas << @peca
    redirect_to @ordens_servico
  end

  def set_ordem_servico
    @ordens_servico = OrdensServico.find(params[:id])
    unless @ordens_servico
      raise ActiveRecord::RecordNotFound, "Couldn't find OrdensServico with 'idOrdens_servicos'=#{params[:id]}"
    end
  end

end
