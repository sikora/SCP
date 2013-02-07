class CreateCategoria < ActiveRecord::Migration
  def change
    create_table :categoria do |t|
      t.string :nm_categoria
      t.string :descricao

      t.timestamps
    end
  end
end
