class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  validate :body, presence: true
  validate :test_id, numericality: { only_integer: true }
  validates :answers, length: { maximum: 4 }
end
