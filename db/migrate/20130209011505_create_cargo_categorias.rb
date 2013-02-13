class CreateCargoCategorias < ActiveRecord::Migration
  def change
    create_table :cargo_categorias do |t|
      t.integer :categoria_id
      t.integer :cargo_id
      t.integer :contrato_id
      t.decimal :valor

      t.timestamps
    end
  end
end
