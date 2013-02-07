class CreateVagas < ActiveRecord::Migration
  def change
    create_table :vagas do |t|
      t.integer :id_lotacao
      t.integer :id_cargocategoria
      t.integer :qt_vagas
      t.integer :id_lei

      t.timestamps
    end
  end
end
