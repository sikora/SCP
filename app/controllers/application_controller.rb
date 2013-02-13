class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protected
  def get_order()
    (params[:column] && params[:order] ? {:column => params[:column], :order => params[:order]} : nil)
  end
end
