class CreatePartidos < ActiveRecord::Migration
  def change
    create_table :partidos do |t|
      t.string :nmpartido
      t.string :nmcompleto
      t.integer :idpartido

      t.timestamps
    end
  end
end
