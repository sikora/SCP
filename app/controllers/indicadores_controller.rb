#encoding: utf-8
class IndicadoresController < ApplicationController
  # GET /indicadores
  # GET /indicadores.json
  def index
    @indicadores = Indicador.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @indicadores }
    end
  end

  # GET /indicadores/1
  # GET /indicadores/1.json
  def show
    @indicador = Indicador.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @indicador }
    end
  end

  # GET /indicadores/new
  # GET /indicadores/new.json
  def new
    @indicador = Indicador.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @indicador }
    end
  end

  # GET /indicadores/1/edit
  def edit
    @indicador = Indicador.find(params[:id])
  end

  # POST /indicadores
  # POST /indicadores.json
  def create
    @indicador = Indicador.new(params[:indicador])

    respond_to do |format|
      if @indicador.save
        format.html { redirect_to @indicador, notice: 'Indicador criado com sucesso.' }
        format.json { render json: @indicador, status: :created, location: @indicador }
      else
        format.html { render action: "new" }
        format.json { render json: @indicador.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /indicadores/1
  # PUT /indicadores/1.json
  def update
    @indicador = Indicador.find(params[:id])

    respond_to do |format|
      if @indicador.update_attributes(params[:indicador])
        format.html { redirect_to @indicador, notice: 'Indicador atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @indicador.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /indicadores/1
  # DELETE /indicadores/1.json
  def destroy
    @indicador = Indicador.find(params[:id])
    @indicador.destroy

    respond_to do |format|
      format.html { redirect_to indicadores_url }
      format.json { head :no_content }
    end
  end
end
