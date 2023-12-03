class OrdensServicoController < ApplicationController
  before_action :set_ordem_servico, only: %i[edit update destroy show]

  def index
    @ordens_servico = OrdemServico.all
    @veiculos = Veiculo.all
    @clientes = Cliente.all
    @equipes = Equipe.all
    @pecas = Peca.all
  end

  def show
  end

  def new
    @ordens_servico = OrdemServico.new
    @veiculos = Veiculo.all
    @clientes = Cliente.all
    @equipes = Equipe.all
    @pecas = Peca.all
  end

  def edit
  end

  def create
    @ordens_servico = OrdemServico.new(ordens_servico_par)

    if @ordens_servico.save
      flash[:notice] = "Ordem de serviço adicionada com sucesso"
      redirect_to action: 'index'
    else
      flash[:notice] = @ordens_servico.errors.full_messages.join(", ")
      redirect_to action: 'index'
    end
  end

  def update
  end

  def destroy
  end

  private
  def ordens_servico_par
    params.require(:ordens_servico).permit(:Data_emissao, :Data_conclusao, :Valor, :Mao_obra, :Servico_descricao, :Status, :Equipes_idEquipes, :Veiculos_idVeiculos, :Clientes_idClientes, peca_ids: [])
  end

  def set_ordem_servico
    @ordens_servico = OrdemServico.find(params[:id])
  end

end
