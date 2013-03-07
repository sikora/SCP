class CreateCargoCategoriasViews < ActiveRecord::Migration
  def change
    execute <<-SQL
      CREATE OR REPLACE VIEW cargo_categorias_views AS SELECT a.id, b.nm_cargo, c.nm_categoria, d.descricao, e.tipo, a.valor
      FROM cargo_categorias a, cargos b, categorias c, contratos d, tipo_contratos e
      WHERE a.cargo_id = b.id AND a.categoria_id = c.id AND a.contrato_id = d.id AND d.tipo_contrato_id = e.id;
    SQL
  end
end
