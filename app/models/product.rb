class Product < ApplicationRecord
  # アソシエーション
  has_many :reservations
  mount_uploader :image, ImageUploader  
end