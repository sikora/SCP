#encoding: utf-8
class PessoasController < ApplicationController
  respond_to :html, :js
  # GET /pessoas
  # GET /pessoas.json
  def index
    @search = (params[:term] ? params[:term] : params[:search])
    @order = get_order()

    if params[:contratado] == "1"
      @defcontratacao = "contratacoes.id IS NULL"
      @title = "Pessoas (não contratadas)"
    elsif params[:contratado] == "2"
      @defcontratacao = "contratacoes.id IS NOT NULL"
      @title = "Pessoas (contratadas)"
    else
      @defcontratacao = ""
      @title = "Pessoas"
    end      

    @pessoas = Pessoa.pagination_with_search(params[:page], @search, @order).find(:all, :limit => 10,
            :joins => "LEFT JOIN contratacoes ON contratacoes.pessoa_id = pessoas.id" ,
            :conditions => @defcontratacao)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pessoas }
    end
  end

  def pessoas_sem_contratacao
    @search = (params[:term] ? params[:term] : params[:search])

    @pessoas = Pessoa.semContratacao(@search)


    respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @pessoas }
      end

  end

  def search
    redirect_to pessoas_path(:search => params[:search][:nome])
  end

  # GET /pessoas/1
  # GET /pessoas/1.json
  def show
    @pessoa = Pessoa.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pessoa }
    end
  end

  # GET /pessoas/new
  # GET /pessoas/new.json
  def new
    @pessoa = Pessoa.new

    if params[:modal_ajax]
      render :layout => false
    else
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @pessoa }
      end
    end
  end

  # GET /pessoas/1/edit
  def edit
    @pessoa = Pessoa.find(params[:id])
  end

  # POST /pessoas
  # POST /pessoas.json
  def create
    @pessoa = Pessoa.new(params[:pessoa])

    respond_to do |format|
      if @pessoa.save
        format.html { redirect_to pessoas_path, notice: 'Pessoa criada com sucesso.' }
        format.json { render json: @pessoa, status: :created, location: @pessoa }
      format.js
      else
        format.html { render action: "new" }
        format.json { render json: @pessoa.errors, status: :unprocessable_entity }
        format.js { render json: @pessoa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pessoas/1
  # PUT /pessoas/1.json
  def update
    @pessoa = Pessoa.find(params[:id])

    respond_to do |format|
      if @pessoa.update_attributes(params[:pessoa])
        format.html { redirect_to pessoas_path, notice: 'Pessoa atualizada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pessoa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pessoas/1
  # DELETE /pessoas/1.json
  def destroy
    @pessoa = Pessoa.find(params[:id])
    @pessoa.destroy

    respond_to do |format|
      format.html { redirect_to pessoas_url }
      format.json { head :no_content }
    end
  end
end
