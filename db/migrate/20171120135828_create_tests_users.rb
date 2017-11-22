class CreateTestsUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :tests_users do |t|
      t.integer :test_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
