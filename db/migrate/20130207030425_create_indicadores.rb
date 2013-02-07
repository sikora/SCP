class CreateIndicadores < ActiveRecord::Migration
  def change
    create_table :indicadores do |t|
      t.string :nminidicador
      t.integer :idpartido
      t.string :cpf
      t.string :telefone

      t.timestamps
    end
  end
end
