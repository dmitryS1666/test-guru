class Test < ApplicationRecord
  has_many :questions
  belongs_to :category
  has_many :tests_users
  has_many :users, through: :tests_users
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  scope :easy_level, -> { where(level: 0..1) }
  scope :middle_level, -> { where(level: 2..4) }
  scope :hard_level, -> { where(level: 5..Float::INFINITY) }

  scope :for_category, -> (category) { joins(:category).where(categories: { title: category} ) }
  scope :for_level, -> (level) { where(level: level) }
  default_scope {order(created_at: :desc)}

  validates :title, presence: true, uniqueness: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal: 0 }

  def self.tests_by_category(category)
    self.for_category(category)
  end



  scope :for_category, -> (category) { joins(:category).where(categories: { title: category} ) }
  scope :descending, -> { order(title: :desc) }
  scope :for_level, -> (level) { where(level: level) }

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.tests_by_category(category)
    self.for_category(category).descending
  end
end
