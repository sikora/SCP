class Lei < ActiveRecord::Base
  attr_accessible :descricao, :dt_lei, :numero
  has_many	:vagas
  has_many :orgaos
end
