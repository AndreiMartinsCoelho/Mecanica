class EquipeController < ApplicationController
  before_action :set_equipe, only: %i[edit update destroy show]

  def index
    @equipe = Equipe.all
    @mecanicos = Mecanico.all
  end

  def show
  end

  def edit
  end

  def new
    @equipe = Equipe.new
    @mecanicos = Mecanico.all
  end

  # ADICIONAR EQUIPE
  def adicionar_equipe
    @equipe = Equipe.new(equipe_par)

    if @equipe.save
      flash[:notice] = "Equipe adicionada com sucesso"
      redirect_to '/'
    else
      flash[:notice] = @equipe.errors.full_messages.join(", ")
      redirect_to '/equipe'
    end
    rescue StandardError => e
    flash[:notice] = "Erro ao adicionar equipe"
    redirect_to '/equipe'
  end

  # UPDATE EQUIPE
  def update
    respond_to do |format|
      if @equipe.update(equipe_par)
        format.html { redirect_to equipe_url(@equipe), notice: "Equipe editada com sucesso..." }
        format.json { render :show, status: :ok, location: @equipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @equipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETAR EQUIPE
  def destroy
    @equipe.destroy!
    respond_to do |format|
      format.html { redirect_to '/', notice: "Equipe cancelada com sucesso..." }
      format.json { head :no_content }
    end
  end

  private

  def equipe_par
    params.require(:equipe).permit(:Nome, :Descricao, :Especialidade, mecanico_ids: [])
  end

  def set_equipe
    @equipe = Equipe.find(params[:id])
  end
end
