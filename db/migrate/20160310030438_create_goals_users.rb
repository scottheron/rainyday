class CreateGoalsUsers < ActiveRecord::Migration
  def change
    create_table :goals_users do |t|
      t.references :goal, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
