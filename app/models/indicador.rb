class Indicador < ActiveRecord::Base
  audited
  # validates_presence_of :cpf, :partido_id, :nm_indicador

  attr_accessible :cpf, :partido_id, :nm_indicador, :telefone
  belongs_to :partido
  has_many :pessoas

end
