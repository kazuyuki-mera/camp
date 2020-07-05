class ProductsController < ApplicationController
  # 一覧画面
  def index
    # product_imagesモデルを作成する
    @top_images = ["top1.jpg", "top2.jpg", "top3.jpg", "top4.jpg", "top5.jpg"] #トップページで利用する画像を４枚くらい用意する
    @products = Product.page(params[:page]).per(12).order('created_at DESC')
  end

  # 新規作成画面
  def new
    @product = Product.new
    @product.product_images.build
  end

  # 作成機能
  def create
    Product.create(product_params)
    redirect_to products_path
  end

  # 詳細画面
  def show
    @product = Product.find(params[:id])
    @products = Product.page(params[:page]).per(3).order('created_at DESC')
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
    # productストロングパラメータ
    def product_params
      params.require(:product).permit(:name, :price, :content, :max_count, product_images_attributes:[:path])
    end
end