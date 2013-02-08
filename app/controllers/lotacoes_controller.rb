#encoding: utf-8
class LotacoesController < ApplicationController
  # GET /lotacoes
  # GET /lotacoes.json
  def index
    @notice = params[:notice]
    @orgaos = Orgao.all(:joins => "left JOIN lotacoes on orgaos.id = lotacoes.id_orgao", :select => "orgaos.*,lotacoes.*,orgaos.id as orgao_id, lotacoes.id as lotacao_id" )
    @orgaos_hash = []
    @orgaos.each do |orgao|
        if !orgao.parent_id? || orgao.parent_id.to_i < 0
          # Incluindo os orgaos na estrutura de arvore
          @orgaos_hash << {:descricao => orgao.nm_orgao , :id => "-#{orgao.orgao_id}", :parent_id => 0}
        end
        
        @orgaos_hash << {:descricao => orgao.descricao , :id => orgao.lotacao_id, :parent_id => orgao.parent_id}

    end

       @lotacoes_array = @orgaos_hash.to_json(:only => [:id, :descricao, :parent_id,:nm_orgao ,:id_orgao])

    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lotacoes_array }
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
    @lotacoes = Lotacao.all(:joins => :orgao, :select => "orgaos.*,lotacoes.*" )
    
    if params[:parent_id] != '' &&  params[:parent_id]  &&  params[:parent_id].to_i > 0
      #  

      @lotacao_pai = Lotacao.find(params[:parent_id]) 
      @parent_id = params[:parent_id]
      @id_orgao = @lotacao_pai.id_orgao
    elsif  params[:parent_id].to_i < 0
      # 
      
      @parent_id =  "#{params[:parent_id]}"
      @id_orgao = -1 *params[:parent_id].to_i
    else
      # 
      @parent_id  = "-#{params[:parent_id]}"
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
    @id_orgao = @lotacao.id_orgao
    
  end

  # POST /lotacoes
  # POST /lotacoes.json
  def create
    @lotacao = Lotacao.new(params[:lotacao])

    @lotacao.parent_id = "-#{@lotacao.id_orgao}" if @lotacao.parent_id <= 0


    respond_to do |format|
      if @lotacao.save
        format.html { redirect_to :action=>'index', notice: 'Lotacao criada com sucesso.' }
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
        format.html { redirect_to :action=>'index', notice: 'Lotacao atualizada com sucesso.' }
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
    if Lotacao.where(:parent_id => params[:id]).count > 0
    flash[:notice] = 'Esta lotação não pode ser apagada.' 
      redirect_to lotacoes_path
    else
      @lotacao = Lotacao.find(params[:id])
      @lotacao.destroy

      respond_to do |format|
        format.html { redirect_to lotacoes_url }
        format.json { head :no_content }
      end
    end
  end
end
