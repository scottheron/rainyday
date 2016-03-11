class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :category
      t.string :google_id

      t.timestamps null: false
    end
  end
end
