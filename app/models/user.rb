class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable
  
  # アソシエーション
  has_many :reservations
  has_many :reviews

  # バリデーション
  validates :name_sei,      presence: true, length: { maximum: 10 }
  validates :name_mei,      presence: true, length: { maximum: 10 }
  validates :name_sei_kana, presence: true, length: { maximum: 20 }
  validates :name_mei_kana, presence: true, length: { maximum: 20 }
  validates :phone_number,  presence: true, length: { maximum: 16 }
  validates :prefecture,    presence: true, length: { maximum: 4 }
  validates :city,          presence: true, length: { maximum: 20 }
  validates :block,                         length: { maximum: 20 }
  validates :building_name,                 length: { maximum: 20 }
  
  def full_name
    self.name_sei + self.name_mei
  end

  def full_name_kana
    self.name_sei_kana + self.name_mei_kana
  end

  def address
    self.prefecture + ' ' + self.city + ' ' + self.block + ' ' + self.building_name
  end
end
