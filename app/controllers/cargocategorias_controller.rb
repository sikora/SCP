class CargocategoriasController < ApplicationController
  # GET /cargocategorias
  # GET /cargocategorias.json
  def index
    @cargocategorias = Cargocategoria.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cargocategorias }
    end
  end

  # GET /cargocategorias/1
  # GET /cargocategorias/1.json
  def show
    @cargocategoria = Cargocategoria.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cargocategoria }
    end
  end

  # GET /cargocategorias/new
  # GET /cargocategorias/new.json
  def new
    @cargocategoria = Cargocategoria.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cargocategoria }
    end
  end

  # GET /cargocategorias/1/edit
  def edit
    @cargocategoria = Cargocategoria.find(params[:id])
  end

  # POST /cargocategorias
  # POST /cargocategorias.json
  def create
    @cargocategoria = Cargocategoria.new(params[:cargocategoria])

    respond_to do |format|
      if @cargocategoria.save
        format.html { redirect_to @cargocategoria, notice: 'Cargocategoria was successfully created.' }
        format.json { render json: @cargocategoria, status: :created, location: @cargocategoria }
      else
        format.html { render action: "new" }
        format.json { render json: @cargocategoria.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cargocategorias/1
  # PUT /cargocategorias/1.json
  def update
    @cargocategoria = Cargocategoria.find(params[:id])

    respond_to do |format|
      if @cargocategoria.update_attributes(params[:cargocategoria])
        format.html { redirect_to @cargocategoria, notice: 'Cargocategoria was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cargocategoria.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cargocategorias/1
  # DELETE /cargocategorias/1.json
  def destroy
    @cargocategoria = Cargocategoria.find(params[:id])
    @cargocategoria.destroy

    respond_to do |format|
      format.html { redirect_to cargocategorias_url }
      format.json { head :no_content }
    end
  end
end
