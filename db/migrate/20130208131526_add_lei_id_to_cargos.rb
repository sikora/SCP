class AddLeiIdToCargos < ActiveRecord::Migration
  def change
    add_column :cargos, :lei_id, :integer
    remove_column :cargos, :simbolo
  end
end
