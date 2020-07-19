class CreateReservationTables < ActiveRecord::Migration[5.2]
  def change
    create_table :reservation_tables, comment: '予約テーブル' do |t|
      t.references :reservation, foreign_key: true, comment: '予約ID'
      t.references :product,     foreign_key: true, comment: '商品ID'
      t.references :user,        foreign_key: true, comment: 'ユーザーID'
      t.date       :reservation_date, null: false,  comment: '予約日'
      t.timestamps
    end
  end
end
