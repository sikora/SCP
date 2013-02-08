class Cargo < ActiveRecord::Base
  audited
  attr_accessible :dt_fim, :dt_inicio, :nm_cargo, :lei_id
  has_many :cargocategorias
  belongs_to :lei

end
