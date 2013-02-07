class Cargo < ActiveRecord::Base
  attr_accessible :dt_fim, :dt_inicio, :nm_cargo, :simbolo
  has_many :cargocategorias

end
