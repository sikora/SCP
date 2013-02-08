class Cargocategoria < ActiveRecord::Base
  attr_accessible :id_cargo, :id_categoria, :id_contrato, :id_orgao, :valor
  belongs_to :cargo, :foreign_key => 'id_cargo'
  belongs_to :categoria, :foreign_key => 'id_categoria'
  belongs_to :orgao, :foreign_key => 'id_orgao'
  belongs_to :contrato, :foreign_key => 'id_contrato'
end
