class Cargocategoria < ActiveRecord::Base
  attr_accessible :id_cargo, :id_categoria, :id_contrato, :id_orgao, :valor
  belgons_to : :cargo, :foreign_key => 'id_cargo'
  belgons_to : :categoria, :foreign_key => 'id_categoria'
  belgons_to : :orgao, :foreign_key => 'id_orgao'
  belgons_to : :contrato, :foreign_key => 'id_contrato'
end
