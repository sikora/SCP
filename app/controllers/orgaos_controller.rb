#encoding: utf-8
class OrgaosController < ApplicationController
  # GET /orgaos
  # GET /orgaos.json
  def index    
    @search = params[:search]
    @order = get_order()

    @orgaos = Orgao.pagination_with_search(params[:page], @search, @order)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orgaos }
    end
  end
  
  def search
    redirect_to orgaos_path(:search => params[:search][:nome])
  end

  # GET /orgaos/1
  # GET /orgaos/1.json
  def show
    @orgao = Orgao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @orgao }
    end
  end

  # GET /orgaos/new
  # GET /orgaos/new.json
  def new
    @orgao = Orgao.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @orgao }
    end
  end

  # GET /orgaos/1/edit
  def edit
    @orgao = Orgao.find(params[:id])
  end

  # POST /orgaos
  # POST /orgaos.json
  def create
    @orgao = Orgao.new(params[:orgao])

    respond_to do |format|
      if @orgao.save
        format.html { redirect_to orgaos_path, notice: 'Orgao criado com sucesso.' }
        format.json { render json: @orgao, status: :created, location: @orgao }
      else
        format.html { render action: "new" }
        format.json { render json: @orgao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orgaos/1
  # PUT /orgaos/1.json
  def update
    @orgao = Orgao.find(params[:id])

    respond_to do |format|
      if @orgao.update_attributes(params[:orgao])
        format.html { redirect_to @orgao, notice: 'Orgao atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @orgao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orgaos/1
  # DELETE /orgaos/1.json
  def destroy
    if Lotacao.where(:id_orgao => params[:id]).count > 0
      flash[:notice] = 'Este órgão possui lotações associadas e não pode ser apagado.' 
      redirect_to orgaos_path
    else

      @orgao = Orgao.find(params[:id])
      @orgao.destroy
  
      respond_to do |format|
        format.html { redirect_to orgaos_url }
        format.json { head :no_content }
      end
    end
  end
end
