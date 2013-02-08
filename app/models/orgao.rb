class Orgao < ActiveRecord::Base
  attr_accessible :dt_fim, :dt_inicio, :id_lei, :nm_orgao
  has_many :cargocategorias
  has_many :lotacoes
  
  validates :nm_orgao, :presence => true
end
