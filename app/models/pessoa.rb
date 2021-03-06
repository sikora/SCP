class Pessoa < ActiveRecord::Base
  audited
  attr_accessible :bairro, :cep, :cpf, :dt_nasc, :endereco, :indicador_id, :nacionalidade, :naturalidade, :nm_mae, :nm_pai, :nm_pessoa, :obs, :sexo, :telefone
  has_many :contratacoes
  belongs_to :indicador
  #validates_presence_of :sexo, :nm_pessoa, :nm_pai, :nm_mae, :cpf


  before_save do
    self.nm_pessoa = self.nm_pessoa.downcase
  end

  def self.pagination_with_search(page, search, order)
    paginate  :page => page,
              :conditions => ['nm_pessoa like ?', "%#{search}%".downcase],
              :order => (order ? "#{order[:column]} #{order[:order]}" : "id")

  end

  scope :semContratacao, lambda { |nome|

    if nome != :all
      joins("LEFT JOIN contratacoes ON contratacoes.pessoa_id = pessoas.id" ).select("pessoas.nm_pessoa as nm_pessoa, pessoas.id as id").where(' contratacoes.id IS NULL and nm_pessoa like ?', "%#{nome}%".downcase).limit(10) 
     else
      joins("LEFT JOIN contratacoes ON contratacoes.pessoa_id = pessoas.id" ).select("pessoas.nm_pessoa as nm_pessoa, pessoas.id as id").where(' contratacoes.id IS NULL').limit(10)
    end

  }


end
