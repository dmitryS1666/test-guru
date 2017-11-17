class User < ApplicationRecord
  def test_level(level)
    Test.where('level = ?', level)
  end
end