class Indicador < ActiveRecord::Base
  audited
  attr_accessible :cpf, :partido_id, :nm_indicador, :telefone
  belongs_to :partido
  has_many :pessoas

end
