class AddTestUserId < ActiveRecord::Migration[5.1]
  def change
    add_column :tests, :user_id, :integer
    add_index :tests, :user_id
  end
end
