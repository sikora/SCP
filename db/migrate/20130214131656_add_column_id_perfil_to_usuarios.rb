class AddColumnIdPerfilToUsuarios < ActiveRecord::Migration
 def self.up
   add_column :usuarios, :perfil_id, :integer
   execute <<-SQL
      ALTER TABLE usuarios
        ADD CONSTRAINT fb_perfis_usuarios
        FOREIGN KEY (perfil_id)
        REFERENCES perfis(id)
    SQL
 end

 def self.down
   remove_column :usuarios, :perfil_id
 end
end
