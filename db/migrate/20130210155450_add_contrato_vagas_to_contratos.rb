class AddContratoVagasToContratos < ActiveRecord::Migration
  def change
    add_column :contratos, :contrato_vagas, :boolean
  end
end
