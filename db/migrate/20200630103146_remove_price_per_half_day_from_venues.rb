class RemovePricePerHalfDayFromVenues < ActiveRecord::Migration[6.0]
  def change
    remove_column :venues, :price_per_half_day, :integer
  end
end
