class CreateVenueAmenities < ActiveRecord::Migration[6.0]
  def change
    create_table :venue_amenities do |t|
      t.references :venue, null: false, foreign_key: true
      t.references :amenity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
