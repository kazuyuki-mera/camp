class UsersController < ApplicationController
  # 詳細画面
  def show
    @user = User.find(params[:id])
    @reservations = Reservation.all.includes(:user).order("start_date ASC")
  end
end
