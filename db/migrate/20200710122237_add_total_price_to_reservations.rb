class AddTotalPriceToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :total_price, :integer, null: false, default: 0, comment: '合計宿泊料金', after: :reserver_count
  end
end
