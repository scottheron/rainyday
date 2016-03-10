class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.text :desc
      t.references :place, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
