class DeleteColumn < ActiveRecord::Migration
  def up
    remove_column :categorias, :valor
  end

  def down
  	add_column :categorias, :valor, :decimal
  end
end
