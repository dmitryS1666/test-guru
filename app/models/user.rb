require 'digest/sha1'

class User < ApplicationRecord
  # include Auth

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :authored_tests, class_name: 'Test', foreign_key: 'user_id'

  has_secure_password

  def test_level(level)
    Test.joins(:tests_users).where('user_id = ? AND level = ?', self.id, level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end