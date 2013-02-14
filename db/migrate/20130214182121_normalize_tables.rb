class NormalizeTables < ActiveRecord::Migration
  def change
    rename_column :indicadores, :nmindicador, :nm_indicador
    rename_column :indicadores, :idpartido, :partido_id

    rename_column :partidos, :nmpartido, :nm_partido
    rename_column :partidos, :nmcompleto, :nm_completo
    remove_column :partidos, :idpartido

    rename_column :perfis, :nmperfil, :nm_perfil
    rename_column :perfis, :descperfil, :descricao

    rename_column :pessoas, :nmpessoa, :nm_pessoa
    rename_column :pessoas, :nmpai, :nm_pai
    rename_column :pessoas, :nmmae, :nm_mae
    rename_column :pessoas, :dtnasc, :dt_nasc
  end
end
