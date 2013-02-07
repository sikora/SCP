class CreateContratos < ActiveRecord::Migration
  def change
    create_table :contratos do |t|
      t.string :desccontrato
      t.integer :id_tipocontrato
      t.date :dt_inicio
      t.date :dt_fim

      t.timestamps
    end
  end
end
