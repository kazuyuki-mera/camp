class ContactsController < ApplicationController
  # 管理者のみアクセス許可
  before_action :authenticate_admin, only: [:index]

  # 一覧画面
  def index
    @contacts = Contact.page(params[:page]).per(3).order('created_at DESC')
  end

  # 新規作成画面
  def new
    @contact = Contact.new
  end

  # 作成機能
  def create
    @contact = Contact.new(contact_params)
    unless @contact.save
      render :new
    end
  end

  ######################### private #########################
  private
    # contactストロングパラメータ
    def contact_params
      params.require(:contact).permit(:name, :name_kana, :email, :content)
    end

    # 管理者判定
    def authenticate_admin
      redirect_to products_path unless user_signed_in? && current_user.admin?
    end

    # 管理者判定
    def authenticate_admin
      redirect_to products_path unless user_signed_in? && current_user.admin?
    end

end
