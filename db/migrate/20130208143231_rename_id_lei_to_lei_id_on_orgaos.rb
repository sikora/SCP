class RenameIdLeiToLeiIdOnOrgaos < ActiveRecord::Migration
  def change
    rename_column :orgaos, :id_lei, :lei_id
  end
end
