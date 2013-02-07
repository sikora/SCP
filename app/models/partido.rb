class Partido < ActiveRecord::Base
  attr_accessible :nmcompleto, :nmpartido
  has_many :indicadores
  belongs_to :lei, :foreign_key	=> 'id_lei'
end
