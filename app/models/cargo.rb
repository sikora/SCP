class Cargo < ActiveRecord::Base
  audited
  attr_accessible :dt_fim, :dt_inicio, :nm_cargo
  has_many :cargo_categorias

end
