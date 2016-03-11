class CreateZips < ActiveRecord::Migration
  def change
    create_table :zips do |t|
      t.integer :code
      t.integer :lat
      t.integer :lng

      t.timestamps null: false
    end
  end
end
