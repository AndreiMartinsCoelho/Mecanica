class PasswordMailer < ApplicationMailer
  default from: 'questbankpa@gmail.com' # Substitua pelo seu endereço de email

  def esqueceu_senha(user, codigo)
    @user = user
    @codigo = codigo
    mail(to: @user.Email, subject: 'Recuperação de Senha')
  end
end
