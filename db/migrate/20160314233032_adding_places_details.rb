class AddingPlacesDetails < ActiveRecord::Migration
  def change
    add_column :places, :url, :text
    add_column :places, :address, :text
    add_column :places, :phone, :string
    add_column :places, :place_id, :string
    remove_column :places, :category
    remove_column :places, :google_id
  end
end
