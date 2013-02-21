class Orgao < ActiveRecord::Base
  audited
  attr_accessible :dt_fim, :dt_inicio, :lei_id, :nm_orgao
  validates_presence_of :nm_orgao
  has_many :cargo_categorias
  has_many :lotacoes
  belongs_to :lei


  # validates :nm_orgao, :presence => true

  def self.pagination_with_search(page, search, order)
    paginate  :page => page,
              :conditions => ['nm_orgao like ?', "%#{search}%"],
              :order => (order ? "#{order[:column]} #{order[:order]}" : "id")
  end
end
