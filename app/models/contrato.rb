class Contrato < ActiveRecord::Base
  audited
  # validates_presence_of :descricao, :tipo_contrato_id, :contrato_vagas
  attr_accessible :descricao, :dt_fim, :dt_inicio, :id, :tipo_contrato_id, :contrato_vagas
  has_many :cargo_categorias
  belongs_to :tipo_contrato
end
