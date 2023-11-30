class MecanicosController < ApplicationController
  before_action :set_mecanico, only: %i[edit update destroy show]

  def index
    @mecanico = Mecanico.new
  end

  def new
    @mecanico = Mecanico.new
  end

  def show
  end

  def edit
  end

  #ADICIONAR MECANICO
  def adicionar_mecanico
    @mecanico = Mecanico.new(mecanico_par)
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

  #DELETE MECANICO
  def destroy
    @mecanico.destroy!
      respond_to do |format|
      format.html { redirect_to '/', notice: "mecanico cancelado com sucesso..." }
      format.json { head :no_content }
    end
  end

  # PATCH/PUT /admins/1
  def update
    respond_to do |format|
      if @mecanico.update(mecanico_params)
        format.html { redirect_to mecanico_url(@mecanico), notice: "mecanico editado com sucesso..." }
        format.json { render :show, status: :ok, location: @mecanico }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mecanico.errors, status: :unprocessable_entity }
        #flash[:notice] = "Erro ao editar a mecanico..."
      end
    end
  end

  private
  def mecanico_params
    params.require(:mecanico).permit(:Nome, :Email, :CPF, :Especialidade)
  end

  def set_mecanico
    @mecanico = Mecanico.find(params[:id])
  end

  #Parametros para adicionar um mecanico...
  def mecanico_par
    params.permit(:Nome, :Email, :CPF, :Especialidade)
  end

end
