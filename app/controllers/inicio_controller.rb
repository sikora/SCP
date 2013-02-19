#encoding: utf-8
class InicioController < ApplicationController
  def index
  	@pessoas_count = Pessoa.find(:all,
            :joins => "LEFT JOIN contratacoes ON contratacoes.pessoa_id = pessoas.id" ,
            :select => "pessoas.nm_pessoa as nm_pessoa, pessoas.id as id",
            :conditions => "contratacoes.id IS NULL").count

  	@pessoas = Pessoa.find(:all, :limit => 10,
            :joins => "LEFT JOIN contratacoes ON contratacoes.pessoa_id = pessoas.id" ,
            :select => "pessoas.nm_pessoa as nm_pessoa, pessoas.id as id",
            :conditions => "contratacoes.id IS NULL")

  	@contratacoes =  Contratacao.order("created_at DESC").limit(3)

    @vagas = Array.new
    @vagas_count = 0
    contagem_vagas = 5

    Vaga.all.each do |v|
      v['vagas_faltantes'] = v.qt_vagas - Contratacao.where(:vaga_id => v.id).count
      @vagas_count += v['vagas_faltantes']
      if contagem_vagas > 0
      	@vagas << v if Contratacao.where(:vaga_id => v.id).count < v.qt_vagas
      	contagem_vagas -=1
      end
    end

  end
end
