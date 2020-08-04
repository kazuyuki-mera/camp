class Contact < ApplicationRecord
  validates :name,      presence: true, length: { maximum: 20 }
  validates :name_kana, presence: true, length: { maximum: 20 }, format: { with: /\A([ァ-ン]|ー)+\z/, message: 'は全角カナで入力してください' } # 全角カナ
  validates :email,     presence: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i } # メールアドレス
  validates :content,   presence: true, length: { maximum: 2000 }

  def full_name_kana
    self.name + "（#{self.name_kana}）"
  end

end
