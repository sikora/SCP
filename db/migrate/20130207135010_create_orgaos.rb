class CreateOrgaos < ActiveRecord::Migration
  def change
    create_table :orgaos do |t|
      t.string :nm_orgao
      t.date :dt_inicio
      t.date :dt_fim
      t.integer :id_lei

      t.timestamps
    end
  end
end
