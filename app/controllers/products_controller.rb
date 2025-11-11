class ProductsController < ApplicationController
  before_action :set_product, only: %i[edit update show destroy]

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def new
    @product = Product.new
  end

  def edit; end

  def show; end

  def create
    @product = Product.new(product_params)
    if @product.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to products_path, notice: 'Produto criado com sucesso!' }
      end
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to products_path, notice: 'Produto atualizado com sucesso!' }
      end
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to products_path, notice: 'Produto removido com sucesso!' }
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :quantity, :image_url)
  end
end
