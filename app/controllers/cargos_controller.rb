#encoding: utf-8
class CargosController < ApplicationController
  # GET /cargos
  # GET /cargos.json
  def index

    if params[:term] && params[:term] != ''
      @cargos = Cargo.where("LOWER(nm_cargo) like ?", "#{params[:term].downcase}%")
    else
      @search = params[:search]
      @order = get_order()

      @cargos = Cargo.pagination_with_search(params[:page], @search, @order)
    end

    #@cargos = Cargo.order(:nm_cargo).all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cargos }
    end
  end

  # GET /cargos/1
  # GET /cargos/1.json
  def show
    @cargo = Cargo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cargo }
    end
  end

  # GET /cargos/new
  # GET /cargos/new.json
  def new
    @cargo = Cargo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cargo }
    end
  end

  # GET /cargos/1/edit
  def edit
    @cargo = Cargo.find(params[:id])
  end

  # POST /cargos
  # POST /cargos.json
  def create
    @cargo = Cargo.new(params[:cargo])

    respond_to do |format|
      if @cargo.save
        format.html { redirect_to cargos_path, notice: 'Cargo criado com sucesso.' }
        format.json { render json: @cargo, status: :created, location: @cargo }
      else
        format.html { render action: "new" }
        format.json { render json: @cargo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cargos/1
  # PUT /cargos/1.json
  def update
    @cargo = Cargo.find(params[:id])

    respond_to do |format|
      if @cargo.update_attributes(params[:cargo])
        format.html { redirect_to cargos_path, notice: 'Cargo atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cargo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cargos/1
  # DELETE /cargos/1.json
  def destroy
    @cargo = Cargo.find(params[:id])
    @cargo.destroy

    respond_to do |format|
      format.html { redirect_to cargos_url }
      format.json { head :no_content }
    end
  end
end
