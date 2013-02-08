class TipoContratosController < ApplicationController
  # GET /tipo_contratos
  # GET /tipo_contratos.json
  def index
    @tipo_contratos = TipoContrato.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tipo_contratos }
    end
  end

  # GET /tipo_contratos/1
  # GET /tipo_contratos/1.json
  def show
    @tipo_contrato = TipoContrato.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tipo_contrato }
    end
  end

  # GET /tipo_contratos/new
  # GET /tipo_contratos/new.json
  def new
    @tipo_contrato = TipoContrato.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tipo_contrato }
    end
  end

  # GET /tipo_contratos/1/edit
  def edit
    @tipo_contrato = TipoContrato.find(params[:id])
  end

  # POST /tipo_contratos
  # POST /tipo_contratos.json
  def create
    @tipo_contrato = TipoContrato.new(params[:tipo_contrato])

    respond_to do |format|
      if @tipo_contrato.save
        format.html { redirect_to @tipo_contrato, notice: 'Tipo contrato was successfully created.' }
        format.json { render json: @tipo_contrato, status: :created, location: @tipo_contrato }
      else
        format.html { render action: "new" }
        format.json { render json: @tipo_contrato.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tipo_contratos/1
  # PUT /tipo_contratos/1.json
  def update
    @tipo_contrato = TipoContrato.find(params[:id])

    respond_to do |format|
      if @tipo_contrato.update_attributes(params[:tipo_contrato])
        format.html { redirect_to @tipo_contrato, notice: 'Tipo contrato was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tipo_contrato.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_contratos/1
  # DELETE /tipo_contratos/1.json
  def destroy
    @tipo_contrato = TipoContrato.find(params[:id])
    @tipo_contrato.destroy

    respond_to do |format|
      format.html { redirect_to tipo_contratos_url }
      format.json { head :no_content }
    end
  end
end
