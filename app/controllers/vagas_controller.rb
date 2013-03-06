#encoding: utf-8
class VagasController < ApplicationController
  # GET /vagas
  # GET /vagas.json
  def index

    @vagas = Array.new
    Vaga.all.each do |v|
      v['vagas_faltantes'] = v.qt_vagas - Contratacao.where(:vaga_id => v.id).count
      if params[:abertas]
        @vagas << v if v['vagas_faltantes'] > 0
      else
        @vagas << v
      end
      
      # if Contratacao.where(:vaga_id => v.id).count < v.qt_vagas
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vagas }
    end
  end

  # GET /vagas/1
  # GET /vagas/1.json
  def show
    @vaga = Vaga.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vaga }
    end
  end

  # GET /vagas/new
  # GET /vagas/new.json
  def new
    @vaga = Vaga.new
    #vagas só podem ser preenchidas com cargo/cagegorias padrões
    #para isto temos um contrato "virtual" apenas para organizar isto
    contrato = Contrato.where(:contrato_vagas => true).first
    @cargo_categorias = CargoCategoria.select("cargo_categorias.id, cargos.nm_cargo, categorias.nm_categoria").joins([:cargo, :categoria]).where(:contrato_id => contrato.id)
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vaga }
    end
  end

  # GET /vagas/1/edit
  def edit
    #vagas só podem ser preenchidas com cargo/cagegorias padrões
    #para isto temos um contrato "virtual" apenas para organizar isto
    contrato = Contrato.where(:contrato_vagas => true).first
    @cargo_categorias = CargoCategoria.select("cargo_categorias.id, cargos.nm_cargo, categorias.nm_categoria").joins([:cargo, :categoria]).where(:contrato_id => contrato.id)

    @vaga = Vaga.find(params[:id])
  end

  # POST /vagas
  # POST /vagas.json
  def create
    @vaga = Vaga.new(params[:vaga])

    respond_to do |format|
      if @vaga.save
        format.html { redirect_to vagas_path, notice: 'Vaga criada com sucesso.' }
        format.json { render json: @vaga, status: :created, location: @vaga }
      else
        format.html { render action: "new" }
        format.json { render json: @vaga.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vagas/1
  # PUT /vagas/1.json
  def update
    @vaga = Vaga.find(params[:id])

    respond_to do |format|
      if @vaga.update_attributes(params[:vaga])
        format.html { redirect_to vagas_path, notice: 'Vaga atualizada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vaga.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vagas/1
  # DELETE /vagas/1.json
  def destroy
    @vaga = Vaga.find(params[:id])
    @vaga.destroy

    respond_to do |format|
      format.html { redirect_to vagas_url }
      format.json { head :no_content }
    end
  end
end
