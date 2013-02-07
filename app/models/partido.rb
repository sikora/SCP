class Partido < ActiveRecord::Base
  attr_accessible :nmcompleto, :nmpartido
  has_many :indicadores
end
