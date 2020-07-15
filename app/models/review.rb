class Review < ApplicationRecord
  # アソシエーション
  belongs_to :product
  belongs_to :user

  # バリデーション
  validates :rate,    presence: true, numericality: { only_integer: true, less_than_or_equal_to: 10 }
  validates :content, presence: true, length: { maximum: 300 }

  def select_rate_count(max_count)
    select_box = []
    for num in 1..max_count do
      select_box << num
    end
  end
end
