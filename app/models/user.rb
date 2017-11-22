class User < ApplicationRecord

  def test_level(level)
    Test.joins(:tests_users).where('user_id = ? AND level = ,', self.id, level)
  end

end