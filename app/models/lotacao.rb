class Lotacao < ActiveRecord::Base
  attr_accessible :descricao, :id_orgao, :parent_id

  has_many :filhos, class_name: "Lotacao", foreign_key: "parent_id"
  belongs_to :pai, class_name: "Lotacao"
  belongs_to :orgao, foreign_key: "id_orgao"

  def self.ltree(pid=nil, path='')
    unless pid
      @lotacoes_tree = Array.new
      Orgao.all.each do |o|
        path = "#{o.nm_orgao}"
        Lotacao.where(:id_orgao => o.id).each do |l|
          next if l.parent_id.to_i > 0
          lot = self.ltree(l.id, "#{path} - #{l.descricao}")
          @lotacoes_tree << lot if lot
        end
      end
      return @lotacoes_tree
    else
      lotacoes = Lotacao.where(:parent_id => pid)

      if lotacoes.count == 0
        return {:path => path, :id => pid}
      end

      lotacoes.each do |l|
        lot = self.ltree(l.id, "#{path} - #{l.descricao}")
        @lotacoes_tree << lot if lot
      end
    end

    return {:path => path, :id => pid}
  end
end
