class RenameFieldsContratacoes < ActiveRecord::Migration
  def change
    rename_column :contratacoes, :id_vaga, :vaga_id
    rename_column :contratacoes, :id_pessoa, :pessoa_id
    rename_column :contratacoes, :id_cargocategoria, :cargo_categoria_id
  end

end
