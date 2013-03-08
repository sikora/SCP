#encoding: utf-8
class ApplicationController < ActionController::Base
  before_filter :authenticate_usuario!
  protect_from_forgery

  def after_sign_in_path_for(resource)
    flash[:success] = "<strong>Login efetuado com sucesso</strong><h4>Bem vindo #{current_usuario.nome.split[0..1].join(" ")}</h4>"
    inicio_index_path
  end

  protected
  def get_order()
    (params[:column] && params[:order] ? {:column => params[:column], :order => params[:order]} : nil)
  end
end
