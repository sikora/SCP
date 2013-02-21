class Cargo < ActiveRecord::Base
  audited
  # validates_presence_of :nm_cargo
  attr_accessible :dt_fim, :dt_inicio, :nm_cargo
  has_many :cargo_categorias

  def self.pagination_with_search(page, search, order)
    paginate  :page => page,
              :conditions => ['nm_cargo like ?', "%#{search}%".downcase],
              :order => (order ? "#{order[:column]} #{order[:order]}" : "id")

  end
end
