class PecasController < ApplicationController
  before_action :set_peca, only: [:edit, :update, :destroy, :show]
  def index
    @peca = Peca.new
  end

  def new
    @peca = Peca.new
  end

  def show
  end

  def edit
  end

  #ADICIONAR
  def adicionar_peca
    @peca = Peca.new(peca_par)
    if @peca.save
      flash[:notice] = "Peça criada com sucesso"
      redirect_to action: 'index'
    else
      flash[:notice] = "Erro ao criar peça"
      redirect_to action: 'index'
    end
  end

  #DELETE
  def destroy
    @peca.destroy!
      respond_to do |format|
      format.html { redirect_to peca_url, notice: "Peça cancelada com sucesso..." }
      format.json { head :no_content }
    end
  end

  # PATCH/PUT /admins/1
  def update
    respond_to do |format|
      if @peca.update(peca_params)
        format.html { redirect_to peca_url(@peca), notice: "Peça editada com sucesso..." }
        format.json { render :show, status: :ok, location: @peca }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @peca.errors, status: :unprocessable_entity }
        #flash[:notice] = "Erro ao editar a peça..."
      end
    end
  end

  private

  def peca_params
    params.require(:peca).permit(:Tipo_peca, :Quantidade, :Valor_peca)
  end

  def set_peca
    @peca = Peca.find_by(params[:idPecas])
  end

  #Parametros para adicionar uma peça nova...
  def peca_par
    params.permit(:Tipo_peca, :Quantidade, :Valor_peca)
  end
end
