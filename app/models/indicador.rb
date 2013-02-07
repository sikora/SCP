class Indicador < ActiveRecord::Base
  attr_accessible :cpf, :idpartido, :nminidicador, :telefone
  belongs_to :partido ,:foreign_key => 'idpartido' 

end
