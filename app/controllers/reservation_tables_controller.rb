class ReservationTablesController < ApplicationController
  def index
    @reservations = ReservationTable.where(reservation_date: Date.today)
  end

  def search
    @reservation_date = Date.strptime(params[:reservation_date],'%Y-%m-%d')
    @reservations = ReservationTable.where(reservation_date: params[:reservation_date].to_date)
  end
end
