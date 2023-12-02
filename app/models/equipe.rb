class Equipe < ApplicationRecord
  has_and_belongs_to_many :mecanicos, join_table: 'mecanicos_equipes'
  validates :Nome, presence: true
  validates :Descricao, presence: true
  validates :Especialidade, presence: true
end
