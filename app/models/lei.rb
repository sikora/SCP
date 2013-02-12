class Lei < ActiveRecord::Base
  audited
  attr_accessible :descricao, :dt_lei, :numero
  has_many :vagas
  has_many :orgaos
  
  validates :numero, :presence => true
  
end
