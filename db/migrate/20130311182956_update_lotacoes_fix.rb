class UpdateLotacoesFix < ActiveRecord::Migration
  def change
  	 execute <<-SQL
  	  UPDATE lotacoes
  	  SET parent_id = null
  	  WHERE parent_id < 0
    SQL
  end

end
