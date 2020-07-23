class ProductsController < ApplicationController
  # 管理者のみアクセス許可
  before_action :authenticate_admin, only: [:new, :create, :edit, :update]
  # 一覧画面
  def index
    # product_imagesモデルを作成する
    @top_images = ["top1.jpg", "top2.jpg", "top3.jpg", "top4.jpg", "top5.jpg"] #トップページで利用する画像を４枚くらい用意する
    @products = Product.page(params[:page]).per(12).order('created_at DESC')
  end

  # 新規作成画面
  def new
    @product = Product.new
  end

  # 作成機能
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  # 詳細画面
  def show
    @product = Product.find(params[:id])
    @products = Product.page(params[:page]).per(3).order('created_at DESC')
    @reviews = Review.where(product_id: @product.id).page(params[:page]).per(10).order('created_at DESC')
  end

  # 編集画面
  def edit
    @product = Product.find(params[:id])
  end

  # 編集機能
  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render :edit
    end
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
      params.require(:product).permit(:name, :heading, :price, :content, :max_count, :image)
    end

    # 管理者判定
    def authenticate_admin
      redirect_to products_path unless user_signed_in? && current_user.admin?
    end
end