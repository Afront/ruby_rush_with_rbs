require "test_helper"

# Class that tests simulator class
class SimulatorTest < Minitest::Test
  # UNIT TESTS FOR METHOD 実行する(prospector_count,jawn) in Simulator Class
  # Equivalence classes:
  # prospector_count = -INFINITY..-1 -> returns nil
  # prospector_count = (not a number) -> returns nil
  # prospector_count = 0 -> returns nil
  # prospector_count = 1..INFINITY -> returns 1, and runs

  # Test that negative value for prospector_count returns nil
  # EDGE CASE
  def test_実行する_negative
    sim = Simulator.new(1, 2,1 )
    sim.setup_map
    mock_prospector = Minitest::Mock.new('Mock Prospector')
    def mock_prospector.開採(_param)
      1
    end

    def mock_prospector.next_location(_param, _param2)
      1
    end

    def mock_prospector.location_count
      1
    end
    assert_nil sim.実行する(-1, mock_prospector)
  end


  # Test that string value for prospector_count returns nil
  # EDGE CASE
  def test_実行する_string
    sim = Simulator.new(1, 2, 1)
    sim.setup_map
    mock_prospector = Minitest::Mock.new('Mock Prospector')
    def mock_prospector.開採(_param)
      1
    end

    def mock_prospector.next_location(_param, _param2)
      1
    end

    def mock_prospector.location_count
      1
    end

    if defined?(RBS::Test)
      assert_raises(RBS::Test::Tester::TypeError) { sim.実行する('HI', mock_prospector) }
    end
  end

  # Test that a value of zero for prospector_count returns nil
  # EDGE CASE
  def test_実行する_zero
    sim = Simulator.new(1, 2, 1)
    sim.setup_map
    mock_prospector = Minitest::Mock.new('Mock Prospector')
    def mock_prospector.開採(_param)
      1
    end

    def mock_prospector.next_location(_param, _param2)
      1
    end

    def mock_prospector.location_count
      1
    end
    assert_nil sim.実行する(0, mock_prospector)
  end

  # Test that a non-negative prospector count reaches 5 different locations
  def test_実行する_passes
    sim = Simulator.new(1, 2, 5)
    sim.setup_map
    mock_prospector = Minitest::Mock.new('Mock Prospector')
    def mock_prospector.開採(_param)
      1
    end

    def mock_prospector.next_location(_param, _param2)
      1
    end

    def mock_prospector.location_count
      1
    end
    assert_equal 5, sim.実行する(4, mock_prospector)
  end

  # UNIT TEST FOR METHOD setup_map() in Simulator Class
  # Test to see if array below is equal to 2D map created in Simulator class
  def test_setup_map
    map = [
      ['Enumerable Canyon', 'Duck Type Beach', 'Monkey Patch City'],
      ['Duck Type Beach', 'Matzburg', 'Enumerable Canyon'],
      ['Monkey Patch City', 'Nil Town', 'Matzburg'],
      ['Nil Town', 'Hash Crossing', 'Monkey Patch City'],
      ['Matzburg', 'Hash Crossing', 'Dynamic Palisades', 'Duck Type Beach', 'Monkey Patch City'],
      ['Hash Crossing', 'Dynamic Palisades', 'Matzburg', 'Nil Town'],
      ['Dynamic Palisades', 'Hash Crossing']
    ]
      sim = Simulator.new(1, 2, 1)
      assert_equal map, sim.setup_map
  end
end
