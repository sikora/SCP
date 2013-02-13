class RenameIdpoliticoPessoas < ActiveRecord::Migration
  def change
    rename_column :pessoas, :idpolitico, :indicador_id
  end

end
