class Orgao < ActiveRecord::Base
  audited
  attr_accessible :dt_fim, :dt_inicio, :lei_id, :nm_orgao
  has_many :cargocategorias
  has_many :lotacoes, foreign_key: "id_orgao"
  belongs_to :lei
  
  validates :nm_orgao, :presence => true
end
