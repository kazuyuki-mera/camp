class UsersController < ApplicationController
  # 詳細画面
  def show
    @user = User.find(params[:id])
  end
end
