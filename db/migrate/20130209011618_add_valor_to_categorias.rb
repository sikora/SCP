class AddValorToCategorias < ActiveRecord::Migration
  def change
    add_column :categorias, :valor, :decimal
  end
end
