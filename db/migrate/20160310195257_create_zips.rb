class CreateZips < ActiveRecord::Migration
  def change
    create_table :zips do |t|
      t.string :code
      t.float :lat
      t.float :lng

      t.timestamps null: false
    end
  end
end
