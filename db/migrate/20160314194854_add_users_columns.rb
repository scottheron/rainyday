class AddUsersColumns < ActiveRecord::Migration
  def change
    add_column :users, :reset_code, :string
    add_column :users, :expires_at, :datetime
  end
end
