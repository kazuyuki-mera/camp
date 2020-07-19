class ReservationTable < ApplicationRecord
  # アソシエーション
  belongs_to :reservation
  belongs_to :product
  belongs_to :user
end
