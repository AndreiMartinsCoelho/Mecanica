class HomeController < ApplicationController
  def index
    @pecas = Peca.all
    @mecanicos = Mecanico.all
  end

  def show
    @peca = Peca.find(params[:idPecas])
    @mecanico = Mecanico.find(params[:idMecanicos])
  end
end
