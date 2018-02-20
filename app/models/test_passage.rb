class TestPassage < ApplicationRecord
  belongs_to :user
  # belongs_to :test, counter_cache: true
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_set_next_question

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
    self.save!
  end

  def success!(ratio, user)
    update_column(:passed, true) if ratio >= 85
    BadgeDistribution.identify_distribution(user) if self.passed
  end

  def has_expired?
    Time.current >= self.timer_finish
  end

  def set_timer_finish
    update_column(:timer_finish, test.timer.minutes.from_now)
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def before_update_set_next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def correct_answer?(answer_ids)
    correct_answer_count = correct_answers.count
    (correct_answer_count == correct_answers.where(id: answer_ids).count) &&
        correct_answer_count == answer_ids.reject(&:empty?).count
  end

  def correct_answers
    current_question.answers.correct
  end
end
