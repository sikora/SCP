#encoding: utf-8
class CargoCategoriasController < ApplicationController
  # GET /cargo_categorias
  # GET /cargo_categorias.json
  def index
    @cargo_categorias = CargoCategoriasView.all

    @search = params[:search]
    @order = get_order()

    @cargo_categorias = CargoCategoriasView.pagination_with_search(params[:page], @search, @order)
  end

  def search
    redirect_to cargo_categorias_path(:search => params[:search][:nome])
  end

  # GET /cargo_categorias/1
  # GET /cargo_categorias/1.json
  def show
    @cargo_categoria = CargoCategoria.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cargo_categoria }
    end
  end

  # GET /cargo_categorias/new
  # GET /cargo_categorias/new.json
  def new
    @cargo_categoria = CargoCategoria.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cargo_categoria }
    end
  end

  # GET /cargo_categorias/1/edit
  def edit
    @cargo_categoria = CargoCategoria.find(params[:id])
  end

  # POST /cargo_categorias
  # POST /cargo_categorias.json
  def create
    @cargo_categoria = CargoCategoria.new(params[:cargo_categoria])

    respond_to do |format|
      if @cargo_categoria.save
        format.html { redirect_to cargo_categorias_path, notice: 'Mapa de Cargo e Categoria criado com sucesso.' }
        format.json { render json: @cargo_categoria, status: :created, location: @cargo_categoria }
      else
        format.html { render action: "new" }
        format.json { render json: @cargo_categoria.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cargo_categorias/1
  # PUT /cargo_categorias/1.json
  def update
    @cargo_categoria = CargoCategoria.find(params[:id])

    respond_to do |format|
      if @cargo_categoria.update_attributes(params[:cargo_categoria])
        format.html { redirect_to cargo_categorias_path, notice: 'Mapa de Cargo e Categoria atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cargo_categoria.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cargo_categorias/1
  # DELETE /cargo_categorias/1.json
  def destroy
    @cargo_categoria = CargoCategoria.find(params[:id])
    @cargo_categoria.destroy

    respond_to do |format|
      format.html { redirect_to cargo_categorias_url }
      format.json { head :no_content }
    end
  end
end
