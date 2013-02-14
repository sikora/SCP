class Perfil < ActiveRecord::Base
  audited
  attr_accessible :descricao, :nm_perfil
  has_many :usuarios
end
