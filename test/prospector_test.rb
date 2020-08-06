require "test_helper"

# Class that tests Prospector class
class ProspectorTest < Minitest::Test
  # UNIT TESTS FOR METHOD gen_random_number(seed, range) in Prospector Class
  # Equivalence classes:
  # seed = (not a number) -> returns nil
  # range = 0 -> returns nil
  # range = -INFINITY..-1 -> returns nil
  # range = 1..INFINITY -> runs

  # Tests invalid seed
  # EDGE CASE
  def test_gen_random_number_seed_invalid
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_location_finder = Minitest::Mock.new('Mock Map Location Finder')
    range = mock_map.length - 1
    jawn = Prospector.new(mock_map, mock_map_location_finder, 1)
    assert_nil jawn.gen_random_number('test', range)
  end

  # Tests zero range
  # EDGE CASE
  def test_gen_random_number_range_zero
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_location_finder = Minitest::Mock.new('Mock Map Location Finder')
    jawn = Prospector.new(mock_map, mock_map_location_finder, 1)
    assert_nil jawn.gen_random_number(3, 0)
  end

  # Tests negative range
  # EDGE CASE
  def test_gen_random_number_range_negative
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_location_finder = Minitest::Mock.new('Mock Map Location Finder')
    jawn = Prospector.new(mock_map, mock_map_location_finder, 1)
    assert_nil jawn.gen_random_number(3, -1)
  end

  # Tests valid entry
  def test_gen_random_number
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_location_finder = Minitest::Mock.new('Mock Map Location Finder')
    jawn = Prospector.new(mock_map, mock_map_location_finder, 1)
    assert_equal 1, jawn.gen_random_number(3, 1)
  end

  # UNIT TESTS FOR METHOD mine(city) in Prospector Class
  # Equivalence classes:
  # city = -INFINITY..-1 -> returns nil
  # city = 0..6 -> beings mining correctly
  # city > 6 -> returns nil

  # Tests that negative city index returns nil
  # EDGE CASE
  def test_mine_negative
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_location_finder = Minitest::Mock.new('Mock Map Location Finder')
    jawn = Prospector.new(mock_map, mock_map_location_finder,1 )
    assert_nil jawn.mine(-1)
  end

  # Tests that valid city index returns 1
  # EDGE CASE
  def test_mine_pass
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_location_finder = Minitest::Mock.new('Mock Map Location Finder')
    jawn = Prospector.new(mock_map, mock_map_location_finder, 1)
    assert_equal 1, jawn.mine(4)
  end

  # Tests that negative city index returns nil
  # EDGE CASE
  def test_mine_invalid
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_location_finder = Minitest::Mock.new('Mock Map Location Finder')
    jawn = Prospector.new(mock_map, mock_map_location_finder, 1)
    assert_nil jawn.mine(8)
  end

  # UNIT TESTS FOR METHOD next_location(curr, seed) in Prospector Class
  # Equivalence classes:
  # city = -INFINITY..-1 -> returns nil
  # city = 0..6 -> beings mining correctly
  # city > 6 -> returns nil

  # Tests that negative city index returns nil
  # EDGE CASE
  def test_next_location_negative
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_location_finder = Minitest::Mock.new('Mock Map Location Finder')
    jawn = Prospector.new(mock_map, mock_map_location_finder,1 )
    assert_nil jawn.next_location(-1, 1)
  end

  # Tests that city index > 6 returns nil
  # EDGE CASE
  def test_next_location_invalid
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_location_finder = Minitest::Mock.new('Mock Map Location Finder')
    jawn = Prospector.new(mock_map, mock_map_location_finder, 1)
    assert_nil jawn.next_location(9, 1)
  end

  # UNIT TESTS FOR METHOD set_ruby_chart() in Prospector Class
  # Equivalence classes:
  # Should always return 2D array
  def test_set_ruby_chart
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_location_finder = Minitest::Mock.new('Mock Map Location Finder')
    jawn = Prospector.new(mock_map, mock_map_location_finder, 1)
    assert_equal [[2,2],[3,3],[2,2],[1,4],[4,1],[3,3],[3,3]], jawn.set_ruby_chart
  end

  # UNIT TESTS FOR METHOD location_count() in Prospector Class
  # Equivalence classes:
  # SHOLD ALWAYS RETURN 1. This method keeps a count of prospector

  # Test to confirm 1 is returned when called
  def test_location_count
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_location_finder = Minitest::Mock.new('Mock Map Location Finder')
    jawn = Prospector.new(mock_map, mock_map_location_finder, 1)
    assert_equal 1, jawn.location_count
  end

  # Test to confirm that 1 is returned at all times
  def test_location_count_repeat
    count = 0
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_location_finder = Minitest::Mock.new('Mock Map Location Finder')
    jawn = Prospector.new(mock_map, mock_map_location_finder, 1)
    80.times { count += jawn.location_count }
    assert_equal 80, count
  end

  # UNIT TESTS FOR METHOD show_results(p) in Prospector Class
  # Equivalence classes:
  # p = -INFINITY..-1 -> returns nil
  # p = 0 -> returns nil
  # p = 1...INFINITY -> displays results
  # p = (not a number) -> return nil

  # Tests that negative returns nil
  # EDGE CASE
  def test_results_negative
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_location_finder = Minitest::Mock.new('Mock Map Location Finder')
    jawn = Prospector.new(mock_map, mock_map_location_finder,1 )
    assert_nil jawn.show_results(-1)
  end

  # Tests that zero returns nil
  # EDGE CASE
  def test_results_zero
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_location_finder = Minitest::Mock.new('Mock Map Location Finder')
    jawn = Prospector.new(mock_map, mock_map_location_finder,1 )
    assert_nil jawn.show_results(0)
  end

  # Tests that valid int returns 1
  # EDGE CASE
  def test_results_pass
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_location_finder = Minitest::Mock.new('Mock Map Location Finder')
    jawn = Prospector.new(mock_map, mock_map_location_finder, 1)
    assert_equal 1, jawn.show_results(4)
  end

  # Tests that not a number returns nil
  # EDGE CASE
  def test_results_invalid
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_location_finder = Minitest::Mock.new('Mock Map Location Finder')
    jawn = Prospector.new(mock_map, mock_map_location_finder, 1)
    assert_nil jawn.show_results("test")
  end

  # UNIT TESTS FOR METHOD check_seed(seed) in Prospector Class
  # Equivalence classes:
  # Should always return true or false
  def test_check_seed_false
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_location_finder = Minitest::Mock.new('Mock Map Location Finder')
    jawn = Prospector.new(mock_map, mock_map_location_finder, 1)
    assert_equal false, jawn.check_seed('test')
  end
end
