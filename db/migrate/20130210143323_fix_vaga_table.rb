class FixVagaTable < ActiveRecord::Migration
  def change
    rename_column :vagas, :id_lotacao, :lotacao_id 
    rename_column :vagas, :id_cargocategoria, :cargo_categoria_id
    rename_column :vagas, :id_lei, :lei_id
    change_column :contratacoes, :valor, :decimal
  end
end
