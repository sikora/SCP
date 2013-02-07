class CreateContratacoes < ActiveRecord::Migration
  def change
    create_table :contratacoes do |t|
      t.integer :id_vaga
      t.integer :id_pessoa
      t.float :valor
      t.integer :id_cargocategoria

      t.timestamps
    end
  end
end
