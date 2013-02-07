class CreateCargocategorias < ActiveRecord::Migration
  def change
    create_table :cargocategorias do |t|
      t.integer :id_cargo
      t.integer :id_categoria
      t.integer :id_orgao
      t.integer :id_contrato
      t.float :valor

      t.timestamps
    end
  end
end
