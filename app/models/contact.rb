class Contact < ApplicationRecord
  validates :name,      presence: true, length: { maximum: 20 }
  validates :name_kana, presence: true, length: { maximum: 20 }, format: { with: /\A([ァ-ン]|ー)+\z/ } # 全角カナ
  validates :email,     presence: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i } # メールアドレス
  validates :content,                   length: { maximum: 2000 }
end
