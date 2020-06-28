class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable
  
  # アソシエーション
  has_many :reservations
  
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
