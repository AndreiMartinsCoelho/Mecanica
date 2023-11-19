class LoginController < ApplicationController
  def index
  end

  def login
    user = Admin.find_by(email: params[:email], Senha: params[:password])

    if user
      # Login bem-sucedido
      session[:idAdmin] = user.id
      redirect_to root_path, notice: 'Login bem-sucedido!'
    else
      # Login falhou
      flash.now[:alert] = 'Email ou senha inválidos'
      render :index
    end
  end

  def logout
    # Logout do usuário
    session[:idAdmin] = nil
    redirect_to root_path, notice: 'Logout bem-sucedido!'
  end
end
