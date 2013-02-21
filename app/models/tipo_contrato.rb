class TipoContrato < ActiveRecord::Base
  audited
  attr_accessible :tipo
  # validates_presence_of :tipo
end
