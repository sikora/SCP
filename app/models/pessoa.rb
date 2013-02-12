class Pessoa < ActiveRecord::Base
  audited
  attr_accessible :bairro, :cep, :cpf, :dtnasc, :endereco, :indicador_id, :nacionalidade, :naturalidade, :nmmae, :nmpai, :nmpessoa, :obs, :sexo, :telefone
  has_many :contratacoes
  belongs_to :indicador 
  
  def self.pagination_with_search(page, search, order)
    paginate  :page => page,
              :conditions => ['nmpessoa like ?', "%#{search}%"],
              :order => (order ? "#{order[:column]} #{order[:order]}" : "id")
  end
end
