require 'bcrypt'

class LoginController < ApplicationController
  before_action :require_login, except: [:index, :esqueceu_senha, :trocar_senha]

  def index
  end

  def esqueceu_senha
  end

  def trocar_senha
  end

  def perfil
    if session[:idAdmin].present?
      @user = Admin.find_by(idAdmin: session[:idAdmin])
      redirect_to login_index_path, notice: 'Por favor, faça login para acessar esta página.' unless @user
    else
      redirect_to login_index_path, notice: 'Por favor, faça login para acessar esta página.'
    end
  end

  def esqueceu_senha
    user = Admin.find_by(Email: params[:Email])
    if user
      # Gera uma nova senha aleatória
      codigo = rand(10**8).to_s.rjust(8,'0')

      # Atualiza a senha do usuário no banco de dados
      user.update_attribute(:Codigo, codigo)

      # Envia a nova senha por e-mail
      PasswordMailer.esqueceu_senha(user, codigo).deliver_now

      redirect_to action: 'trocar_senha'
    else
      flash[:notice] = 'Email não encontrado'
      render 'login/esqueceu_senha'
    end
  end

  def trocar_senha
    user = Admin.find_by(Codigo: params[:Codigo])

    if user
      # Troca a senha do Admin usando o código
      nova_senha = params[:nova_senha]
      confirma_senha = params[:confirma_senha]

      if nova_senha == confirma_senha
        # Criptografa a nova senha usando BCrypt
        encrypted_password = BCrypt::Password.create(nova_senha)

        user.update_attribute(:Senha, encrypted_password)
        flash[:notice] = 'Senha alterada com sucesso'
        redirect_to login_index_path
      else
        flash[:notice] = 'Senhas não conferem'
        render 'login/trocar_senha', locals: { user: user }
      end
    else
      flash[:notice] = 'Código ou email inválido'
      render 'login/trocar_senha', locals: { user: user }
    end
  end

  def login
    user = Admin.find_by(email: params[:email])
    if user && BCrypt::Password.new(user.Senha) == params[:password]
      # Login bem-sucedido
      session[:idAdmin] = user.idAdmin
      redirect_to root_path, notice: 'Login bem-sucedido!'
    else
      # Login falhou
      redirect_to login_index_path, notice: 'Email ou senha inválidos'
    end
  end

  def logout
    session.delete(:idAdmin)
    redirect_to login_index_path, notice: 'Deslogado com sucesso!'
  end

  private

  def require_login
    # Implement your logic here
  end

  def user_params
    params.require(:admin).permit(:Nome, :Email, :CPF)
  end

end
