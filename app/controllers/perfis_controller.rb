class PerfisController < ApplicationController
  # GET /perfis
  # GET /perfis.json
  def index
    if params[:filter] && params[:filter] !=''
      @perfis = Perfil.where("nm_perfil like ?", '%' + params[:filter] + '%') 
    else 
      @perfis = Perfil.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @perfis }
    end
  end

  # GET /perfis/1
  # GET /perfis/1.json
  def show
    @perfil = Perfil.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @perfil }
    end
  end

  # GET /perfis/new
  # GET /perfis/new.json
  def new
    @perfil = Perfil.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @perfil }
    end
  end

  # GET /perfis/1/edit
  def edit
    @perfil = Perfil.find(params[:id])
  end

  # POST /perfis
  # POST /perfis.json
  def create
    @perfil = Perfil.new(params[:perfil])

    respond_to do |format|
      if @perfil.save
        format.html { redirect_to @perfil, notice: 'Perfil was successfully created.' }
        format.json { render json: @perfil, status: :created, location: @perfil }
      else
        format.html { render action: "new" }
        format.json { render json: @perfil.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /perfis/1
  # PUT /perfis/1.json
  def update
    @perfil = Perfil.find(params[:id])

    respond_to do |format|
      if @perfil.update_attributes(params[:perfil])
        format.html { redirect_to @perfil, notice: 'Perfil was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @perfil.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /perfis/1
  # DELETE /perfis/1.json
  def destroy
    @perfil = Perfil.find(params[:id])
    @perfil.destroy

    respond_to do |format|
      format.html { redirect_to perfis_url }
      format.json { head :no_content }
    end
  end
end
