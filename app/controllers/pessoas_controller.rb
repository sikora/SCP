class PessoasController < ApplicationController
  respond_to :html, :js
  # GET /pessoas
  # GET /pessoas.json
  def index
    if params[:term] && params[:term] != ''
      @pessoas = Pessoa.where("LOWER(nmpessoa) like ?", "#{params[:term].downcase}%")
    else
      @search = params[:search]
      @order = get_order()

      @pessoas = Pessoa.pagination_with_search(params[:page], @search, @order)
    end

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
        format.html { redirect_to @pessoa, notice: 'Pessoa atualizada com sucesso.' }
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
