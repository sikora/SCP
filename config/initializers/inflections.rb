# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format
# (all these examples are active by default):
ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
  inflect.irregular 'cargo', 'cargos'
  inflect.irregular 'indicador', 'indicadores'
  inflect.irregular 'tipocontrato', 'tipocontratos'
  inflect.irregular 'contrato', 'contratos'
  inflect.irregular 'perfil', 'perfis'
  inflect.irregular 'contratacao', 'contratacoes'
  inflect.irregular 'cargocategoria', 'cargocategorias'
  inflect.irregular 'lotacao', 'lotacoes'
  inflect.irregular 'categoria', 'categorias'
#   inflect.uncountable %w( fish sheep )
end
#
# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections do |inflect|
#   inflect.acronym 'RESTful'
# end
