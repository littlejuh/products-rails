module Api
  class ProductsController < ApplicationController
    before_action :set_product, only: %i[show update destroy]
    protect_from_forgery with: :null_session

    def index
      render json: Product.all
    end

    def show
      render json: @product
    end

    def create
      product = Product.new(product_params)
      if product.save
        render json: product, status: :created
      else
        render json: { errors: product.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def update
      if @product.update(product_params)
        render json: @product
      else
        render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def destroy
      @product.destroy
      head :no_content
    end

    private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :price, :quantity, :image_url)
    end
  end
end
