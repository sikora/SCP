class CargoCategoria < Application
  audited
  attr_accessible :cargo_id, :categoria_id, :contrato_id, :valor, :valor_f
  belongs_to :cargo
  belongs_to :categoria
  belongs_to :contrato



end
