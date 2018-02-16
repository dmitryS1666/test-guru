class RenameSuccessToPasedForTestPassages < ActiveRecord::Migration[5.1]
  def change
    rename_column :test_passages, :success, :passed
  end
end
