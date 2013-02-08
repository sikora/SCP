class FixContrato < ActiveRecord::Migration
  def change
    rename_column :contratos, :desccontrato, :descricao
    rename_column :contratos, :id_tipocontrato, :tipo_contrato_id
  end
end
