#encoding: utf-8
class ApplicationController < ActionController::Base
  before_filter :authenticate_usuario!
  protect_from_forgery
  
  protected
  def get_order()
    (params[:column] && params[:order] ? {:column => params[:column], :order => params[:order]} : nil)
  end
end
