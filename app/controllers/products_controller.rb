class ProductsController < ApplicationController
  # 一覧画面
  def index
    @top_images = ["test1.png", "test2.png", "test3.png"] #トップページで利用する画像を４枚くらい用意する
    @products = Product.all
  end

  # 新規作成画面
  def new
    @product = Product.new
  end

  # 作成機能
  def create
    Product.create(product_params)
    redirect_to products_path
  end

  # 詳細画面
  def show
    @product = Product.find(params[:id])
  end

  # 編集画面
  def edit
    @product = Product.find(params[:id])
  end

  # 編集機能
  def update
    product = Product.find(params[:id])
    product.update(product_params)
    redirect_to product_path(product)
  end

  # 削除機能
  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to products_path
  end

  ######################### private #########################
  private
    def product_params
      params.require(:product).permit(:name, :price, :content)
    end
end