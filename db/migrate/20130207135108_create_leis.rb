class CreateLeis < ActiveRecord::Migration
  def change
    create_table :leis do |t|
      t.string :numero
      t.string :descricao
      t.date :dt_lei

      t.timestamps
    end
  end
end
