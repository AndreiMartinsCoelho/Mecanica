class Admin < ApplicationRecord
  has_secure_password
  validates :Nome, presence: true
  validates :Email, presence: true
  validates :Senha, presence: true
  validates :CPF, presence: true
  validates :Codigo, presence: true
  validates :Nome, length: { minimum: 3 }
end
