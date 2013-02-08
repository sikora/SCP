class LotacoesController < ApplicationController
  # GET /lotacoes
  # GET /lotacoes.json
  def index
    @lotacoes = Lotacao.all
    
    @lotacoes_array = @lotacoes.to_json(:only => [:id, :descricao, :parent_id])
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
  # GET /lotacoes/new/1
  # GET /lotacoes/new.json
  def new
    @lotacao = Lotacao.new

    if params[:parent_id] != '' &&  params[:parent_id]
      @lotacao_pai = Lotacao.find(params[:parent_id]) 
      @parent_id = params[:parent_id]
    else      
      @parent_id  = 0
    end


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lotacao }
    end
  end



  # GET /lotacoes/1/edit
  def edit
    @lotacao = Lotacao.find(params[:id])
    @parent_id  = @lotacao.parent_id
    
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
