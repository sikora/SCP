class CargoCategoriasView < ActiveRecord::Base
  attr_accessible :descricao, :id, :nm_cargo, :nm_categoria, :tipo, :valor

  def self.pagination_with_search(page, search, order)
    paginate  :page => page,
              :conditions => ['descricao like ?', "%#{search}%"],
              :order => (order ? "#{order[:column]} #{order[:order]}" : "id")
  end
end
