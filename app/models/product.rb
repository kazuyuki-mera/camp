class Product < ApplicationRecord
  # アソシエーション
  has_many :reservations
end