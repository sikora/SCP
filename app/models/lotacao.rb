class Lotacao < ActiveRecord::Base
  attr_accessible :descricao, :id_orgao, :parent_id

  has_many :filhos, class_name: "Lotacao", foreign_key: "parent_id"
  belongs_to :pai, class_name: "Lotacao"
  belongs_to :orgao,foreign_key: "id_orgao"
end
