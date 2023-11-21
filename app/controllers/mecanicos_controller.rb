class MecanicosController < ApplicationController
  def index
    @mecanico = Mecanico.new
  end

  def new
    @mecanico = Mecanico.new
  end

  def adicionar_mecanico
    @mecanico = Mecanico.new(mecanico_params)
    if @mecanico.save
      flash[:notice] = "mecanico adicionar com sucesso"
      redirect_to action: 'index'
    else
      flash[:notice] = "Erro ao adicionar mecanico"
      redirect_to action: 'index'
    end
    rescue StandardError => e
      flash[:notice] = "Erro ao adicionar mecanico"
      redirect_to action: 'index'
  end

  private

  def mecanico_params
    params.permit(:Nome, :Email, :CPF, :Especialidade)
  end

end
