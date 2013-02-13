class Perfil < ActiveRecord::Base
  audited
  attr_accessible :descperfil, :nmperfil
  has_many :usuarios
end
