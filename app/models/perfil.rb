class Perfil < ActiveRecord::Base
  attr_accessible :descperfil, :nmperfil
  has_many :usuarios
end
