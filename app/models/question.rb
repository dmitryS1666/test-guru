class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  validates :body, presence: true
  validates :test_id, numericality: { only_integer: true }
end