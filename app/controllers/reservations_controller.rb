class ReservationsController < ApplicationController
  # 新規作成画面
  def new
    if user_signed_in?
      @product = Product.find(params[:product_id])
      @reservation = Reservation.new
    else
      flash[:notice] = '予約には会員登録もしくはログインが必要です。'
      redirect_to new_user_registration_path # ユーザー新規作成画面
    end
  end

  # 作成機能
  def create
    Reservation.create(reservation_params)
  end

  # 詳細画面
  def show
    @reservation = Reservation.find(1)
  end

  ######################### private #########################
  private
    def reservation_params
      params.require(:reservation).permit(:start_date, :end_date).merge(product_id: params[:product_id], user_id: current_user.id)
    end
end