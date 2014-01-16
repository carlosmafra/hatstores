class Admin::ProdutosController < ApplicationController
  before_action :set_admin_produto, only: [:show, :edit, :update, :destroy]

  # GET /admin/produtos
  # GET /admin/produtos.json
  def index
    @admin_produtos = Admin::Produto.all
  end

  # GET /admin/produtos/1
  # GET /admin/produtos/1.json
  def show
  end

  # GET /admin/produtos/new
  def new
    @admin_produto = Admin::Produto.new
  end

  # GET /admin/produtos/1/edit
  def edit
  end

  # POST /admin/produtos
  # POST /admin/produtos.json
  def create
    @admin_produto = Admin::Produto.new(admin_produto_params)

    respond_to do |format|
      if @admin_produto.save
        format.html { redirect_to @admin_produto, notice: 'Produto was successfully created.' }
        format.json { render action: 'show', status: :created, location: @admin_produto }
      else
        format.html { render action: 'new' }
        format.json { render json: @admin_produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/produtos/1
  # PATCH/PUT /admin/produtos/1.json
  def update
    respond_to do |format|
      if @admin_produto.update(admin_produto_params)
        format.html { redirect_to @admin_produto, notice: 'Produto was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin_produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/produtos/1
  # DELETE /admin/produtos/1.json
  def destroy
    @admin_produto.destroy
    respond_to do |format|
      format.html { redirect_to admin_produtos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_produto
      @admin_produto = Admin::Produto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_produto_params
      params.require(:admin_produto).permit(:code, :name, :url, :price, :nparcela, :vparcela, :image, :marca)
    end
end
