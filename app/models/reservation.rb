class Reservation < ApplicationRecord
  # アソシエーション
  belongs_to :product
  belongs_to :user

  def start_end_date
    self.start_date.strftime("%Y年%m月%d日") + ' 〜 ' + self.end_date.strftime("%m月%d日")
  end

  def select_reserver_count(max_count)
    select_box = []
    for num in 1..max_count do
      select_box << num
    end
  end
end