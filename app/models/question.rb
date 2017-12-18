class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  scope :by_test_id, -> (test_id) { where(test_id: test_id)}

  validates :body, presence: true
  validates :test_id, numericality: { only_integer: true }
end
