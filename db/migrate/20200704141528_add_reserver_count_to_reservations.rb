class AddReserverCountToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :reserver_count, :integer, null: false, default: 0, comment: '予約人数', after: :end_date
  end
end
