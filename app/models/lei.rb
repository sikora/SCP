class Lei < ActiveRecord::Base
  audited
  attr_accessible :descricao, :dt_lei, :numero
  has_many :vagas
  has_many :orgaos
  # validates_presence_of :numero, :descricao


  def self.pagination_with_search(page, search, order)
    paginate  :page => page,
              :conditions => ['numero like ?', "%#{search}%"],
              :order => (order ? "#{order[:column]} #{order[:order]}" : "id")
  end

end
