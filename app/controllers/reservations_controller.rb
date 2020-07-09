class ReservationsController < ApplicationController
  # ユーザーのログインチェック
  before_action :require_login

  # 新規作成画面
  def new
    # 商品情報を取得
    @product = Product.find(params[:product_id])
    # 予約情報を初期化
    @reservation = Reservation.new
  end

  # 作成機能
  def create
    @reservation = Reservation.new(reservation_params)
    unless @reservation.save
      @product = Product.find(params[:product_id])
      render :new
    end
  end

  # 詳細画面
  def show
    @reservation = Reservation.find(params[:id])
    if current_user.id == @reservation.user.id
      redirect_to new_user_registration_path
    end
  end

  ######################### private #########################
  private
    # reservationストロングパラメータ
    def reservation_params
      params.require(:reservation).permit(:start_date, :end_date, :reserver_count).merge(product_id: params[:product_id], user_id: current_user.id)
    end

    # ユーザーが未ログインの場合、会員登録画面へリダイレクト
    def require_login
      unless user_signed_in?
        flash[:notice] = '予約には会員登録もしくはログインが必要です。'
        redirect_to new_user_registration_path # ユーザー新規作成画面
      end
    end
end