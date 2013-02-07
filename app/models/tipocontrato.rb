class Tipocontrato < ActiveRecord::Base
  attr_accessible :id, :tpcontrato
  has_many :contratos
end
