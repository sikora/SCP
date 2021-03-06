#encoding: utf-8
class PartidosController < ApplicationController
  before_filter :authenticate_usuario!
  # GET /partidos
  # GET /partidos.json
  def index
    if params[:term] && params[:term] !=''
      @partidos = Partido.where("nm_completo like ? or nm_partido like ?", '%' + params[:term] + '%', '%' + params[:term] + '%')
    else
      @partidos = Partido.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @partidos }
    end
  end

  # GET /partidos/1
  # GET /partidos/1.json
  def show
    @partido = Partido.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @partido }
    end
  end

  # GET /partidos/new
  # GET /partidos/new.json
  def new
    @partido = Partido.new

    if params[:modal_ajax]
      render :layout => false
    else
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @partido }
      end
    end
  end

  # GET /partidos/1/edit
  def edit
    @partido = Partido.find(params[:id])
  end

  # POST /partidos
  # POST /partidos.json
  def create
    @partido = Partido.new(params[:partido])

    respond_to do |format|
      if @partido.save
        format.html { redirect_to partidos_path, notice: 'Partido criado com sucesso.' }
        format.json { render json: @partido, status: :created, location: @partido }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @partido.errors, status: :unprocessable_entity }
        format.js { render json: @partido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /partidos/1
  # PUT /partidos/1.json
  def update
    @partido = Partido.find(params[:id])

    respond_to do |format|
      if @partido.update_attributes(params[:partido])
        format.html { redirect_to partidos_path, notice: 'Partido atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @partido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /partidos/1
  # DELETE /partidos/1.json
  def destroy
    @partido = Partido.find(params[:id])
    @partido.destroy

    unless @partido.errors
      respond_to do |format|
        format.html { redirect_to partidos_url }
        format.json { head :no_content }
      end
    else
      #binding.pry
      redirect_to partidos_path, flash: {error: @partido.errors[:base].join('<br>') }
    end
  end
end
