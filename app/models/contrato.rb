class Contrato < ActiveRecord::Base
  audited
  attr_accessible :descricao, :dt_fim, :dt_inicio, :id, :tipo_contrato_id, :contrato_vagas
  has_many :cargocategorias
  belongs_to :tipo_contrato
end
