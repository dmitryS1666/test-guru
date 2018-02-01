class AddQuestionsToTests < ActiveRecord::Migration[5.1]
  def change
    add_reference :questions, :test_id, foreign_key: true
    add_foreign_key :questions, :tests
  end
end
