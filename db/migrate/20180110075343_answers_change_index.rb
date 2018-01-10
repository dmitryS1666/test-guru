class AnswersChangeIndex < ActiveRecord::Migration[5.1]
  def change
    remove_index :answers, :question_id
    add_index :answers, :question_id, unique: false
  end
end
