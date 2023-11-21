class Mecanico < ApplicationRecord
  validates :Nome, presence:true
  validates :Email, presence:true
  validates :CPF, presence:true
  validates :Especialidade, presence:true
  validates :Nome, length: { minimum: 3 }
  validates :Email, length: { minimum: 3 }
  validates :CPF, length: { minimum: 3 }
  validates :CPF, numericality: { greater_than: 0 }
  validates :CPF, numericality: { only_integer: true }
end
