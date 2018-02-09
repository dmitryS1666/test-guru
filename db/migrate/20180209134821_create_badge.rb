class CreateBadge < ActiveRecord::Migration[5.1]
  def change
    create_table :badges do |t|
      t.string :name
      t.string :url_file
      t.string :rule_name
      t.string :rule_value
      t.timestamps
    end
    add_index :badges, :name
  end
end
