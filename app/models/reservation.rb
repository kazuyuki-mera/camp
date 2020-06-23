class Reservation < ApplicationRecord
  # アソシエーション
  belongs_to :product
  belongs_to :user
end
