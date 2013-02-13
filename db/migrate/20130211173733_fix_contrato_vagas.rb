class FixContratoVagas < ActiveRecord::Migration
  def change
    change_column :contratos, :contrato_vagas, :boolean, :default => false
  end
end
