class Cliente < ApplicationRecord
  validates :Nome, presence: true
  validates :Email, presence: true
  validates :CPF, presence: true
  validates :Telefone, presence: true
  validates :Endereco, presence: true
  validates :Nome, length: { minimum: 3 }
  validates :Email, length: { minimum: 3 }
  validates :CPF, length: { minimum: 3 }
  validates :Telefone, length: { minimum: 3 }
  validates :Endereco, length: { minimum: 3 }
  validates :CPF, numericality: { greater_than: 0 }
  validates :Telefone, numericality: { greater_than: 0 }
  validates :CPF, numericality: { only_integer: true }
  validates :Telefone, numericality: { only_integer: true }
end
