class Veiculo < ApplicationRecord
  validates :Placa , presence: true
  validates :Modelo, presence: true
  validates :Ano, presence: true
  validates :Cor, presence: true
  validates :Clientes_idClientes, presence: true
end
