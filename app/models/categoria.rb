class Categoria < ActiveRecord::Base
  audited
  # validates_presence_of :descricao, :nm_categoria, :valor
  attr_accessible :descricao, :nm_categoria, :valor
  has_many :cargo_categorias
end
