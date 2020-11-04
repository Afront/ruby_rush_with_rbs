require_relative 'prospector'
require_relative 'map_location_finder'

module RubyRush
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
        実行する(prospector_count, jawn)
        jawn.show_results(prospector_count)
        prospector_count += 1
      end
    end

    # Set up map of potential paths
    def setup_map
      @map = [
        ['Enumerable Canyon', 'Duck Type Beach', 'Monkey Patch City'],
        ['Duck Type Beach', 'Matzburg', 'Enumerable Canyon'],
        ['Monkey Patch City', 'Nil Town', 'Matzburg'],
        ['Nil Town', 'Hash Crossing', 'Monkey Patch City'],
        ['Matzburg', 'Hash Crossing', 'Dynamic Palisades', 'Duck Type Beach', 'Monkey Patch City'],
        ['Hash Crossing', 'Dynamic Palisades', 'Matzburg', 'Nil Town'],
        ['Dynamic Palisades', 'Hash Crossing']
      ]
    end

    # The ruby hunting begins!
    def 実行する(prospector_count, jawn)
      prospector_count = prospector_count.to_i
      success = nil
      location_count = 0
      location_index = 0
      puts "Rubyist #{prospector_count} starting in #{@map[location_index][0]}."

      while(location_count < @num_turns && prospector_count > 0)
        #puts "Rubyist #{prospector_count} is hunting for rubies."
        jawn.開採(location_index)
        location_count += jawn.location_count
        location_index = jawn.next_location(location_index, @seed)
        success = location_count
      end
      success
    end
  end
end
