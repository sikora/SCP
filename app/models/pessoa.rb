class Pessoa < ActiveRecord::Base
  attr_accessible :bairro, :cep, :cpf, :dtnasc, :endereco, :idpolitico, :nacionalidade, :naturalidade, :nmmae, :nmpai, :nmpessoa, :obs, :sexo, :telefone
  has_many :contratacoes
  belongs_to :indicador ,:foreign_key => 'idpolitico' 
end
