class Simulator
  def initialize(seed, num_prospectors, num_turns)
    @seed = seed
    @num_prospectors = num_prospectors
    @num_turns = num_turns
  end

  def play
    puts "Start simulation...."
    setup_map
    count = 1
    while count <= @num_prospectors
      run(count)
      count += 1
    end
  end

  # Set up map of potential paths
  def setup_map
    @map = ['Enumerable Canyon']
  end

  # The ruby hunting begins!
  def run(count)
    puts "Rubyist #{count} is hunting for rubies in #{@map[0]}."
  end
end
