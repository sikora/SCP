class Categoria < ActiveRecord::Base
  attr_accessible :descricao, :nm_categoria
  has_many :cargocategorias
end
