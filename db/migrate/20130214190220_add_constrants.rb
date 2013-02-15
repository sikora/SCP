class AddConstrants < ActiveRecord::Migration
  def change
  	add_foreign_key(:indicadores, :partidos)
  	add_foreign_key(:pessoas, :indicadores)
  	add_foreign_key(:contratacoes, :pessoas)
  	add_foreign_key(:contratacoes, :vagas)
  	add_foreign_key(:vagas, :leis)
  	add_foreign_key(:vagas, :lotacoes)
  	add_foreign_key(:orgaos, :leis)
  	add_foreign_key(:lotacoes, :orgaos)
  	add_foreign_key(:vagas, :cargo_categorias)
  	add_foreign_key(:contratacoes, :cargo_categorias)
  	add_foreign_key(:cargo_categorias, :categorias)
  	add_foreign_key(:cargo_categorias, :cargos)
  	add_foreign_key(:contratos, :tipo_contratos)
  	add_foreign_key(:cargo_categorias, :contratos)
  end
end
