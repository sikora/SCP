class Contratacao < ActiveRecord::Base
  attr_accessible :id_cargocategoria, :id_pessoa, :id_vaga, :valor
  belongs_to :pessoa, :foreign_key => 'id_pessoa'
  belongs_to :cargocategoria, :foreign_key => 'id_cargocategoria'
  belongs_to :vaga, :foreign_key => 'id_vaga'
  
end
