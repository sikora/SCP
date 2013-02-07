class CreateLotacoes < ActiveRecord::Migration
  def change
    create_table :lotacoes do |t|
      t.string :descricao
      t.integer :id_orgao
      t.integer :parent_id

      t.timestamps
    end
  end
end
