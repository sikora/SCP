class Partido < ActiveRecord::Base
  audited
  attr_accessible :nm_completo, :nm_partido
  has_many :indicadores
  belongs_to :lei, :foreign_key	=> 'id_lei'
end
