class CreateTipocontratos < ActiveRecord::Migration
  def change
    create_table :tipocontratos do |t|
      t.string :tpcontrato

      t.timestamps
    end
  end
end
