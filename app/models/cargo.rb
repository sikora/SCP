class Cargo < ActiveRecord::Base
  audited
  validates_presence_of :nm_cargo
  attr_accessible :dt_fim, :dt_inicio, :nm_cargo
  has_many :cargo_categorias


end
