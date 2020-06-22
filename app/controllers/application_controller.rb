class ApplicationController < ActionController::Base
  # CSRF対策（クロスサイトリクエストフォージェリ）
  protect_from_forgery with: :exception

  # deviseキー追加
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    # deviseにキーを追加
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,        keys: [:name_sei, :name_mei, :name_sei_kana, :name_mei_kana, :phone_number, :prefecture, :city, :block, :building_name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name_sei, :name_mei, :name_sei_kana, :name_mei_kana, :phone_number, :prefecture, :city, :block, :building_name])
    end
end
