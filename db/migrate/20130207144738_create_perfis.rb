class CreatePerfis < ActiveRecord::Migration
  def change
    create_table :perfis do |t|
      t.string :nmperfil
      t.string :descperfil

      t.timestamps
    end
  end
end
