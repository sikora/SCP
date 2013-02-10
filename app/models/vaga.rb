class Vaga < ActiveRecord::Base
  attr_accessible :cargo_categoria_id, :lei_id, :lotacao_id, :qt_vagas
  has_many	:contratacoes
  belongs_to :cargo_categoria
  belongs_to :lei
  belongs_to :lotacao
end
