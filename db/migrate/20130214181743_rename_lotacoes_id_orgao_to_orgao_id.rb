class RenameLotacoesIdOrgaoToOrgaoId < ActiveRecord::Migration
  def change
    rename_column :lotacoes, :id_orgao, :orgao_id
  end
end
