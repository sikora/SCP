class CargoCategoria < ActiveRecord::Base
  audited
  attr_accessible :cargo_id, :categoria_id, :contrato_id, :valor
  belongs_to :cargo
  belongs_to :categoria
  belongs_to :contrato

  before_save :imprime

  before_update :imprime


  def valor=(valor)
      write_attribute(:valor, valor.gsub(',', '.'))
  end

  def imprime
    puts self.valor

  end

end
