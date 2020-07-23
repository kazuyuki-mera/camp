class ReservationTablesController < ApplicationController
  # 管理者のみアクセス許可
  before_action :authenticate_admin
  def index
    @reservations = ReservationTable.where(reservation_date: Date.today)
  end

  def search
    @reservation_date = Date.strptime(params[:reservation_date],'%Y-%m-%d')
    @reservations = ReservationTable.where(reservation_date: params[:reservation_date].to_date)
  end

  private
    # 管理者判定
    def authenticate_admin
      redirect_to products_path unless user_signed_in? && current_user.admin?
    end
end
