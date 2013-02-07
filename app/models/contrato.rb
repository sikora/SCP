class Contrato < ActiveRecord::Base
  attr_accessible :desccontrato, :dt_fim, :dt_inicio, :id, :id_tipocontrato
  has_many :cargocategorias
  belongs_to :tipocontrato ,:foreign_key => 'id_tipocontrato' 
end
