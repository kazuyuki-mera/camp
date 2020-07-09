class Reservation < ApplicationRecord
  # アソシエーション
  belongs_to :product
  belongs_to :user

  # バリデーション
  validates :start_date,     presence: true
  validates :end_date,       presence: true
  validates :reserver_count, presence: true
  validate  :start_date_not_before_today
  validate  :end_date_not_before_today
  validate  :start_date_not_after_end_date
  validate  :end_date_not_before_start_date

  def start_end_date
    self.start_date.strftime("%Y年%m月%d日") + ' 〜 ' + self.end_date.strftime("%m月%d日")
  end

  def select_reserver_count(max_count)
    select_box = []
    for num in 1..max_count do
      select_box << num
    end
  end

  def start_date_not_before_today
    errors.add(:start_date, "は今日以降の日付を選択してください") if start_date.nil? || start_date < Date.today
  end

  def end_date_not_before_today
    errors.add(:end_date, "は今日以降の日付を選択してください") if end_date.nil? || end_date < Date.today
  end

  def start_date_not_after_end_date
    errors.add(:start_date, "は宿泊終了日以前の日付を選択してください") if start_date > end_date
  end

  def end_date_not_before_start_date
    errors.add(:end_date, "は宿泊開始日以降の日付を選択してください") if end_date < start_date
  end
end