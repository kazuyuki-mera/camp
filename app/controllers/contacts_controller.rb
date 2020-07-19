class ContactsController < ApplicationController

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
end
