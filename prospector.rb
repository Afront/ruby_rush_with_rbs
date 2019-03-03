class Prospector
  def initialize(map, map_location_finder, num_turns)
    @map = map
    @map_location_finder = map_location_finder
    @visited_locations = 1
    @num_turns = num_turns
    @fake_ruby_total = 0
    @ruby_total = 0
    @ruby_plural = "rubies"
    @fake_ruby_plural = "rubies"
    @days = 0
    # Set 2D array for ruby and fake ruby possiblities
    # Index 0 = ruby, Index 1 = fake ruby
    @ruby_chart = [[2,2],[3,3],[2,2],[1,4],[4,1],[3,3],[3,3]]
  end

  # TODO: set up method for ruby hunting.
  def mine(city)
    city = city.to_i
    loop do
      @days += 1
      ruby = rand(@ruby_chart[city][0]).to_i
      fake_ruby = rand(@ruby_chart[city][1]).to_i

      # Get correct plural form of ruby count.
      if ruby == 1
        @ruby_plural = "ruby"
      else
        @ruby_plural = "rubies"
      end
      if fake_ruby == 1
        @fake_ruby_plural = "ruby"
      else
        @fake_ruby_plural = "rubies"
      end
      
      puts "\tFound #{ruby} #{@ruby_plural} and #{fake_ruby} fake #{@fake_ruby_plural} in #{@map[city][0]}."
      @ruby_total += ruby
      @fake_ruby_total += fake_ruby
      break if ruby.zero? && fake_ruby.zero?
    end
  end

  # Generates random number based on passed in seed.
  def gen_random_number(seed, range)
    seed = seed.to_i
    rng = Random.new(seed)
    num = rng.rand(range) + 1
    num
  end

  # Go to next location pseudorandomly.
  def next_location(curr, seed)
    curr = curr.to_i
    range = 1
    range = @map[curr].length - 1
    next_city = gen_random_number(seed, range).to_i

    if @visited_locations < @num_turns
      puts "Heading from #{@map[curr][0]} to #{@map[curr][next_city]}."
    end

    @visited_locations += 1
    location_index = @map_location_finder.get_location_index(@map[curr][next_city])
    location_index
  end

  # Show results of prospector's hunt.
  def show_results(p)
    puts "After #{@days} days, Rubyist #{p} found:"
    if @ruby_total == 1
      puts "\t#{@ruby_total} ruby."
    else
      puts "\t#{@ruby_total} rubies."
    end
    if @fake_ruby_total == 1
      puts "\t#{@fake_ruby_total} fake ruby."
    else
      puts "\t#{@fake_ruby_total} fake rubies"
    end
    puts "Going home victorious!" if @ruby_total >= 10
    puts "Going home sad." if @ruby_total < 10 && @ruby_total > 0
    puts "Going home empty-handed." if @ruby_total == 0
    puts "\n"
  end
end
