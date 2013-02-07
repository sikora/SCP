class CreateCargos < ActiveRecord::Migration
  def change
    create_table :cargos do |t|
      t.string :nm_cargo
      t.string :simbolo
      t.date :dt_inicio
      t.date :dt_fim

      t.timestamps
    end
  end
end
