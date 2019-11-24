class ProductsController < ApplicationController
  before_action :find_product, only:[:edit,
                                     :update,
                                     :show,
                                     :destroy]

  def index
    @products = Product.all
    @products_count = Product.count
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params_product)

    if @product.save
      redirect_to root_path, notice: '新增成功！'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(params_product)
      redirect_to root_path, notice: '編輯成功！'
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @product.destroy
    redirect_to root_path, notice: '刪除成功'
  end

  private
  def find_product
    @product = Product.find(params[:id])
  end

  def params_product
    params.require(:product).permit(:name,
                                    :price,
                                    :description,
                                    :sku)
  end
end
