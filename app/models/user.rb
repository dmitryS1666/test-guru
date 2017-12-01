class User < ApplicationRecord
  validate :email, presence: true, uniqueness: true

  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :authored_tests, class_name: 'Test', foreign_key: 'user_id'

  def test_level(level)
    Test.joins(:tests_users).where('user_id = ? AND level = ?', self.id, level)
  end
end