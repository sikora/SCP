#encoding: utf-8
class InicioController < ApplicationController
  def index
  	@pessoas = Pessoa.find(:all, :limit => 3,
            :joins => "LEFT JOIN contratacoes ON contratacoes.pessoa_id = pessoas.id" ,
            :select => "pessoas.nm_pessoa as nm_pessoa, pessoas.id as id",
            :conditions => "contratacoes.id IS NULL")

  	@contratacoes =  Contratacao.order("created_at DESC").limit(3)

  end
end