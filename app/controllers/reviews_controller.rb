class ReviewsController < ApplicationController
  # ユーザーのログインチェック
  before_action :require_login

  def new
    @product = Product.find(params[:product_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    unless @review.save
      @product = Product.find(params[:product_id])
      render :new
    end
  end

    ######################### private #########################
    private
    # reviewストロングパラメータ
    def review_params
      params.require(:review).permit(:rate, :content).merge(product_id: params[:product_id], user_id: current_user.id)
    end

    # ユーザーが未ログインの場合、会員登録画面へリダイレクト
    def require_login
      unless user_signed_in?
        flash[:notice] = 'レビューを書くには会員登録もしくはログインが必要です。'
        redirect_to new_user_registration_path # ユーザー新規作成画面
      end
    end
end
