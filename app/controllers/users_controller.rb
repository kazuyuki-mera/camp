class UsersController < ApplicationController
  # ログインユーザーのみアクセス許可
  before_action :authenticate_user!
  
  # 詳細画面
  def show
    if current_user.id == params[:id].to_i
      @user = User.find(params[:id])
      @reservations = Reservation.all.includes(:user).order("start_date ASC")
    else
      redirect_to products_path
    end
  end
end
