class LotacoesController < ApplicationController
  # GET /lotacoes
  # GET /lotacoes.json
  def index
    @lotacoes = Lotacao.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lotacoes }
    end
  end

  # GET /lotacoes/1
  # GET /lotacoes/1.json
  def show
    @lotacao = Lotacao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lotacao }
    end
  end

  # GET /lotacoes/new
  # GET /lotacoes/new.json
  def new
    @lotacao = Lotacao.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lotacao }
    end
  end

  # GET /lotacoes/1/edit
  def edit
    @lotacao = Lotacao.find(params[:id])
  end

  # POST /lotacoes
  # POST /lotacoes.json
  def create
    @lotacao = Lotacao.new(params[:lotacao])

    respond_to do |format|
      if @lotacao.save
        format.html { redirect_to @lotacao, notice: 'Lotacao was successfully created.' }
        format.json { render json: @lotacao, status: :created, location: @lotacao }
      else
        format.html { render action: "new" }
        format.json { render json: @lotacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lotacoes/1
  # PUT /lotacoes/1.json
  def update
    @lotacao = Lotacao.find(params[:id])

    respond_to do |format|
      if @lotacao.update_attributes(params[:lotacao])
        format.html { redirect_to @lotacao, notice: 'Lotacao was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lotacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lotacoes/1
  # DELETE /lotacoes/1.json
  def destroy
    @lotacao = Lotacao.find(params[:id])
    @lotacao.destroy

    respond_to do |format|
      format.html { redirect_to lotacoes_url }
      format.json { head :no_content }
    end
  end
end
