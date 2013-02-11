class Indicador < ActiveRecord::Base
  audited
  attr_accessible :cpf, :idpartido, :nmindicador, :telefone
  belongs_to :partido ,:foreign_key => 'idpartido' 
  has_many :pessoas

end
