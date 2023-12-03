class OrdensServico < ApplicationRecord
  has_and_belongs_to_many :pecas, join_table: 'ordens_pecas'
  has_and_belongs_to_many :pecas
  validates :Data_emissao , presence:true
  validates :Data_conclusao , presence:true
  validates :Valor , presence:true
  validates :Mao_obra , presence:true
  validates :Servico_descricao , presence:true
  validates :Status , presence:true
  validates :Equipes_idEquipes , presence:true
  validates :Veiculos_idVeiculos , presence:true
  validates :Clientes_idClientes , presence:true
end
