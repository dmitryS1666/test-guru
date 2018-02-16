class Test < ApplicationRecord
  has_many :questions
  belongs_to :category
  has_many :test_passages
  has_many :users, through: :test_passages
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  scope :for_level, -> (level) { where(level: level) }
  scope :easy_level, -> { for_level(0..1) }
  scope :middle_level, -> { for_level(2..4) }
  scope :hard_level, -> { for_level(5..Float::INFINITY) }

  scope :for_category, -> (category) { joins(:category).where(categories: { title: category} ) }
  default_scope {order(created_at: :desc)}

  validates :title, presence: true, uniqueness: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal: 0 }
  validates :timer, numericality: { only_integer: true, greater_than_or_equal_to: 1 }, allow_nil: true

  def self.tests_by_category(category)
    self.for_category(category)
  end

  def set_questions_amount_to_session
    Rails.cache.write("test_#{self.id}", self.questions.count)
  end

end
