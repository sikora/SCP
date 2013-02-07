class CreateIndicadores < ActiveRecord::Migration
  def change
    create_table :indicadores do |t|
      t.string :nmindicador
      t.integer :idpartido
      t.string :cpf
      t.string :telefone

      t.timestamps
    end
  end
end
