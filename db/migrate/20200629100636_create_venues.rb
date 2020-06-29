class CreateVenues < ActiveRecord::Migration[6.0]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :address
      t.string :description
      t.integer :capacity
      t.integer :price_per_day
      t.integer :price_per_half_day
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
