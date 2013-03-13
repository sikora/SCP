class Contratacao < Application
  audited

  # validates_presence_of :pessoa_id, :vaga_id, :valor
  attr_accessible :cargo_categoria_id, :pessoa_id, :vaga_id, :valor, :valor_f
  belongs_to :pessoa
  belongs_to :cargo_categoria
  belongs_to :vaga


end
