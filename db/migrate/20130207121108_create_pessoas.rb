class CreatePessoas < ActiveRecord::Migration
  def change
    create_table :pessoas do |t|
      t.string :nmpessoa
      t.string :cpf
      t.string :telefone
      t.string :endereco
      t.string :cep
      t.string :bairro
      t.string :naturalidade
      t.string :nacionalidade
      t.string :nmpai
      t.string :nmmae
      t.date :dtnasc
      t.string :sexo
      t.integer :idpolitico
      t.text :obs

      t.timestamps
    end
  end
end
