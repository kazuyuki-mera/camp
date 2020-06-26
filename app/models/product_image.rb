class ProductImage < ApplicationRecord
  # アソシエーション
  belongs_to :product

  mount_uploader :images, ImageUploader
end
