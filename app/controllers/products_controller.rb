class ProductsController < ApplicationController
  before_filter :authenticate_admin!, except: [:index]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path, notice: "Product successfully created"
    else
      flash[:alert] = 'Product was not created'
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  private
  def product_params
    params.require(:product).permit(:brand, :price, :description, :model, :product_photo)
  end
end