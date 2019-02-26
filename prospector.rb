class Prospector
  def initialize(map, map_location_finder, num_turns)
    @map = map
    @map_location_finder = map_location_finder
    @visited_locations = 1
    @num_turns = num_turns
  end

  # TODO: set up method for ruby hunting.

  # Generates random number based on passed in seed.
  def gen_random_number(seed, range)
    rng = Random.new(seed)
    num = rng.rand(range) + 1
    num
  end
  # Go to next location pseudorandomly.
  def next_location(curr, seed)
    range = 1
    range = @map[curr].length - 1
    next_city = gen_random_number(seed, range)

    if @visited_locations < @num_turns
      puts "Heading from #{@map[curr][0]} to #{@map[curr][next_city]}."
    end

    @visited_locations += 1
    location_index = @map_location_finder.get_location_index(@map[curr][next_city])
    location_index
  end
end
