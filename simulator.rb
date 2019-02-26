require_relative 'prospector'
require_relative 'map_location_finder'

class Simulator
  def initialize(seed, num_prospectors, num_turns)
    @seed = seed
    @num_prospectors = num_prospectors
    @num_turns = num_turns
  end

  def play
    puts "Start simulation...."
    setup_map
    prospector_count = 1
    while prospector_count <= @num_prospectors
      jawn = Prospector.new(@map, MapLocationFinder.new, @num_turns)
      run(prospector_count, jawn)
      prospector_count += 1
    end
  end

  # Set up map of potential paths
  def setup_map
    @map = [
      ['Enumerable Canyon', 'Monkey Patch City', 'Duck Type Beach'],
      ['Monkey Patch City', 'Nil Town', 'Matzburg'],
      ['Duck Type Beach', 'Matzburg'],
      ['Nil Town', 'Hash Crossing'],
      ['Matzburg', 'Hash Crossing', 'Dynamic Palisades', 'Duck Type Beach'],
      ['Hash Crossing', 'Dynamic Palisades'],
      ['Dynamic Palisades']
    ]
  end

  # The ruby hunting begins!
  def run(prospector_count, jawn)
    location_count = 0
    location_index = 0
    puts "Rubyist #{prospector_count} starting in #{@map[location_index][0]}."

    while(location_count < @num_turns && prospector_count > 0)
      puts "Rubyist #{prospector_count} is hunting for rubies."
      location_count += 1
      location_index = jawn.next_location(location_index, @seed)
    end
  end
end
