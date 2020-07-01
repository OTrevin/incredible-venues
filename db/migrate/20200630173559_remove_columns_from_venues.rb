class RemoveColumnsFromVenues < ActiveRecord::Migration[6.0]
  def change
    remove_column :venues, :morning, :string
    remove_column :venues, :afternoon, :string
  end
end
