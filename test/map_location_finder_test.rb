require "test_helper"

# Class that tests MapLocationFinder class
class MapLocationFinderTest < Minitest::Test
  # UNIT TESTS FOR METHOD get_location_index(location) in MapLocationFinder Class
  # Equivalence classes:
  # location = -INFINITY..-1 -> returns nil
  # location = 1..INFINITY -> returns nil
  # location = invalid name -> returns nil
  # location = 0 -> returns nil
  # location = valid city name -> returns index of location, and executes

  # Tests negative input value
  # EDGE CASE
  def test_get_location_index_negative
    finder = MapLocationFinder.new
    assert_nil finder.get_location_index(-1)
  end

  # Tests positive input value
  # EDGE CASE
  def test_get_location_index_positive
    finder = MapLocationFinder.new
    assert_nil finder.get_location_index(1)
  end

  # Tests invalid location name string
  # EDGE CASE
  def test_get_location_index_invalid
    finder = MapLocationFinder.new
    assert_nil finder.get_location_index("INVALID LOCATION")
  end

  # Tests zero as input value
  # EDGE CASE
  def test_get_location_index_zero
    finder = MapLocationFinder.new
    assert_nil finder.get_location_index(0)
  end

  # Tests valid location name string
  def test_get_location_index_valid
    finder = MapLocationFinder.new
    assert_equal 4, finder.get_location_index("Matzburg")
  end
end
