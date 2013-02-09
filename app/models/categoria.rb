class Categoria < ActiveRecord::Base
  attr_accessible :descricao, :nm_categoria, :valor
  has_many :cargo_categorias
end
