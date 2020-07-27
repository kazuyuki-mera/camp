class Product < ApplicationRecord
  # アソシエーション
  has_many :reservations
  has_many :reviews
  has_many :reservation_tables

  # バリデーション
  validates :name,      presence: true, length: { maximum: 20 }
  validates :heading,   presence: true, length: { maximum: 14 }
  validates :price,     presence: true, numericality: { only_integer: true, less_than: 999999 }
  validates :content,   presence: true, length: { maximum: 200 }
  validates :max_count, presence: true, numericality: { only_integer: true, less_than: 999 }

  mount_uploader :image, ImageUploader

  def review_average
    unless reviews.average(:rate) == nil
      reviews.average(:rate).round
    else
      0
    end
  end

  def self.search(input)
    return nil if input == ""
    Product.where(['name LIKE ?', "%#{input}%"] ).limit(10)
  end
end