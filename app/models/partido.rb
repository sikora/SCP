class Partido < ActiveRecord::Base
  audited
  attr_accessible :nm_completo, :nm_partido
  # validates_presence_of :nm_completo, :nm_partido
  has_many 		   	:indicadores
  belongs_to 	  	:lei, :foreign_key	=> 'id_lei'
  validate	   	 	:check_duplicity
  before_destroy  :check_if_indicador_belongs_to_partido

  def check_duplicity
  	if Partido.where("nm_partido = ? or nm_completo = ?", self.nm_partido, self.nm_completo).count > 0
  		errors.add(:base, "Ja existe um partido com esse nome ou sigla.")
  	end  	
  end

  def check_if_indicador_belongs_to_partido
    if Indicador.where("partido_id = ?", self.id).count > 0
      errors.add(:base, "Existem pessoas indicadores pertencentes a este partido. Nao posso apagar.")
      return false
    end
  end

end
