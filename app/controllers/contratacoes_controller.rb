#encoding: utf-8
class ContratacoesController < ApplicationController
  # GET /contratacoes
  # GET /contratacoes.json
  def index
    @contratacoes = Contratacao.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contratacoes }
    end
  end

  # GET /contratacoes/1
  # GET /contratacoes/1.json
  def show
    @contratacao = Contratacao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contratacao }
    end
  end

  # GET /contratacoes/new
  # GET /contratacoes/new.json
  def new
    @contratacao = Contratacao.new

    @vagas = Array.new

    Vaga.all.each do |v|
      puts "here"
      @vagas << v if Contratacao.where(:vaga_id => v.id).count < v.qt_vagas
    end
    puts @vagas

    @valor_cargo_categoria =  CargoCategoria.select('cargo_categorias.id as id, valor').where(:contrato_id => params[:contrato_id]).all.to_json



    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contratacao }
    end
  end

  # GET /contratacoes/1/edit
  def edit

    @vagas = Array.new
    Vaga.all.each do |v|
      puts "here"
      @vagas << v if Contratacao.where(:vaga_id => v.id).count < v.qt_vagas
    end

    @contratacao = Contratacao.find(params[:id])


  end

  # POST /contratacoes
  # POST /contratacoes.json
  def create
    @contratacao = Contratacao.new(params[:contratacao])

    respond_to do |format|
      if @contratacao.save
        format.html { redirect_to @contratacao, notice: 'Contratacao was successfully created.' }
        format.json { render json: @contratacao, status: :created, location: @contratacao }
      else
        format.html { render action: "new" }
        format.json { render json: @contratacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contratacoes/1
  # PUT /contratacoes/1.json
  def update
    @contratacao = Contratacao.find(params[:id])

    respond_to do |format|
      if @contratacao.update_attributes(params[:contratacao])
        format.html { redirect_to @contratacao, notice: 'Contratacao was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contratacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contratacoes/1
  # DELETE /contratacoes/1.json
  def destroy
    @contratacao = Contratacao.find(params[:id])
    @contratacao.destroy

    respond_to do |format|
      format.html { redirect_to contratacoes_url }
      format.json { head :no_content }
    end
  end
end
