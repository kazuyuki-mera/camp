class Product < ApplicationRecord
  # アソシエーション
  has_many :reservations

  # バリデーション
  validates :name,      presence: true, length: { maximum: 20 }
  validates :price,     presence: true, numericality: { only_integer: true, less_than: 999999 }
  validates :content,   presence: true, length: { maximum: 200 }
  validates :max_count, presence: true, numericality: { only_integer: true, less_than: 999 }

  mount_uploader :image, ImageUploader
end