class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations, comment: '予約表' do |t|
      t.references :product, foreign_key: true, comment: '商品ID'
      t.references :user,    foreign_key: true, comment: 'ユーザーID'
      t.date       :start_date, null: false,    comment: '宿泊開始日'
      t.date       :end_date,   null: false,    comment: '宿泊終了日'
      t.timestamps
    end
  end
end
