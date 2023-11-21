class Peca < ApplicationRecord
  validates :Tipo_peca, presence: true
  validates :Valor_peca, presence: true
  validates :Quantidade, presence: true
  validates :Tipo_peca, length: { minimum: 3 }
  validates :Valor_peca, numericality: { greater_than: 0 }
  validates :Quantidade, numericality: { greater_than: 0 }
  validates :Quantidade, numericality: { only_integer: true }
end
