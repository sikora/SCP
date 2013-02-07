class Vaga < ActiveRecord::Base
  attr_accessible :id_cargocategoria, :id_lei, :id_lotacao, :qt_vagas
  has_many	:contratacoes
  has_many :cargocategorias
  belongs_to :lei, :foreign_key	=> 'id_lei'
end
