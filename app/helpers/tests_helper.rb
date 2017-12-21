module TestsHelper

  TEST_LEVEL = { 0 => :easy, 1 => :elementary, 2 => :advanced, 3 => :hard }.freeze

  def test_level(level)
    TEST_LEVEL[level] || :hero
  end

end
