class RemoveLeiIdFromCargos < ActiveRecord::Migration
  def change
    remove_column :cargos, :lei_id
  end

end
