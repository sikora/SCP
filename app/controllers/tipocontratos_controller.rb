class TipocontratosController < ApplicationController
  # GET /tipocontratos
  # GET /tipocontratos.json
  def index
    @tipocontratos = Tipocontrato.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tipocontratos }
    end
  end

  # GET /tipocontratos/1
  # GET /tipocontratos/1.json
  def show
    @tipocontrato = Tipocontrato.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tipocontrato }
    end
  end

  # GET /tipocontratos/new
  # GET /tipocontratos/new.json
  def new
    @tipocontrato = Tipocontrato.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tipocontrato }
    end
  end

  # GET /tipocontratos/1/edit
  def edit
    @tipocontrato = Tipocontrato.find(params[:id])
  end

  # POST /tipocontratos
  # POST /tipocontratos.json
  def create
    @tipocontrato = Tipocontrato.new(params[:tipocontrato])

    respond_to do |format|
      if @tipocontrato.save
        format.html { redirect_to @tipocontrato, notice: 'Tipocontrato was successfully created.' }
        format.json { render json: @tipocontrato, status: :created, location: @tipocontrato }
      else
        format.html { render action: "new" }
        format.json { render json: @tipocontrato.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tipocontratos/1
  # PUT /tipocontratos/1.json
  def update
    @tipocontrato = Tipocontrato.find(params[:id])

    respond_to do |format|
      if @tipocontrato.update_attributes(params[:tipocontrato])
        format.html { redirect_to @tipocontrato, notice: 'Tipocontrato was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tipocontrato.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipocontratos/1
  # DELETE /tipocontratos/1.json
  def destroy
    @tipocontrato = Tipocontrato.find(params[:id])
    @tipocontrato.destroy

    respond_to do |format|
      format.html { redirect_to tipocontratos_url }
      format.json { head :no_content }
    end
  end
end
