class RemovePeriodFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :period, :string
  end
end
