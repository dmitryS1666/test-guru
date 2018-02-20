class AddTimerFinishToTestPassages < ActiveRecord::Migration[5.1]
  def change
    add_column :test_passages, :timer_finish, :datetime
  end
end
