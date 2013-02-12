class CargoCategoria < ActiveRecord::Base
  audited
  attr_accessible :cargo_id, :categoria_id, :contrato_id, :valor
  belongs_to :cargo
  belongs_to :categoria
  belongs_to :contrato
end
