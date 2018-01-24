class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :authored_tests, class_name: 'Test', foreign_key: 'user_id'
  has_many :gists

  validates :email, presence: true, uniqueness: true

  def test_level(level)
    Test.joins(:tests_users).where('user_id = ? AND level = ?', self.id, level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    self.is_a?(Admin)
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

end