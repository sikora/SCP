class Orgao < ActiveRecord::Base
  audited
  attr_accessible :dt_fim, :dt_inicio, :lei_id, :nm_orgao
  has_many :cargocategorias
  has_many :lotacoes, foreign_key: "id_orgao"
  belongs_to :lei

  validates :nm_orgao, :presence => true
  
  def self.pagination_with_search(page, search, order)
    paginate  :page => page,
              :conditions => ['nm_orgao like ?', "%#{search}%"],
              :order => (order ? "#{order[:column]} #{order[:order]}" : "id")
  end
end
