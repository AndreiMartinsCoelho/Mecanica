class PecasController < ApplicationController
  def index
    @peca = Peca.new
  end

  def new
    @peca = Peca.new
  end

  def adicionar_peca
    @peca = Peca.new(peca_params)
    if @peca.save
      flash[:notice] = "Peça criada com sucesso"
      redirect_to action: 'index'
    else
      flash[:notice] = "Erro ao criar peça"
      redirect_to action: 'index'
    end
  end

  private

  def peca_params
    params.permit(:Tipo_peca, :Valor_peca, :Quantidade)
  end
end
