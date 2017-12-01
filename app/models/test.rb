class Test < ApplicationRecord
  has_many :questions
  belongs_to :category
  has_many :tests_users
  has_many :users, through: :tests_users

  scope :easy_level, -> {where(level: 0..1)}
  scope :middle_level, -> {where(level: 2..4)}
  scope :hard_level, -> {where(level: 5..Float::INFINITY)}

  scope :join_with_category, -> {joins('INNER JOIN categories ON tests.category_id = categories.id')}
  scope :category, -> (category) {where('categories.title = ?', category)}
  default_scope {order(created_at: :DESC)}

  validate :title, presence: true, uniqueness: true
  validate :level, numericality: { only_integer: true, :greater_than_or_equal_to => 0 }

  def self.tests_by_category(category)
    Test.select('title').join_with_category.category(category)
  end

end
