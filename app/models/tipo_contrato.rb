class TipoContrato < ActiveRecord::Base
  audited
  attr_accessible :tipo
end
