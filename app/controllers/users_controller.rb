class UsersController < ApplicationController
  # ログインユーザーのみアクセス許可
  before_action :authenticate_user!
  
  # 詳細画面
  def show
    if current_user.id == params[:id].to_i
      @user = User.find(params[:id])
      @reservations = Reservation.page(params[:page]).per(5).where(user_id: current_user.id).includes(:user).order('created_at DESC')
    else
      redirect_to products_path
    end
  end

  # レビュー履歴一覧画面
  def reviews
    @reviews = Review.page(params[:page]).per(5).where(user_id: current_user.id).includes(:user).order('created_at DESC')
  end
end
