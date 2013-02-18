class Lotacao < ActiveRecord::Base
  audited
  attr_accessible :descricao, :orgao_id, :parent_id

  has_many :filhos, class_name: "Lotacao", foreign_key: "parent_id"
  belongs_to :pai, class_name: "Lotacao"
  belongs_to :orgao

  def breadcrumb(desc='')
    if desc != ''
      desc = "#{self.descricao} - #{desc}"
    else
      desc = self.descricao
    end

    return Lotacao.find(self.parent_id).breadcrumb(desc) if self.parent_id > 0
    return "#{self.orgao.nm_orgao} - #{desc}"
  end

  def self.ltree(pid=nil, path='')
    unless pid
      @lotacoes_tree = Array.new
      Orgao.all.each do |o|
        path = "#{o.nm_orgao}"
        Lotacao.where(:orgao_id => o.id).each do |l|
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
