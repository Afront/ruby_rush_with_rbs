require_relative 'simulator'

def show_usage
  puts "Usage:\nruby ruby_rush.rb *seed* *num_prospectors* *num_turns*\n*seed* should be an integer\n*num_prospectors* should be a non-negative integer\n*num_turns* should be a non-negative integer"
end

def validate_args(args)
  args.count == 3 && Integer(args[0]) && Integer(args[1]) && Integer(args[2]) && args[1].to_i > 0 && args[2].to_i > 0 rescue false
end

# Check arguments to see if valid.
valid_args = validate_args ARGV
if valid_args
  seed = ARGV[0].to_i
  num_prospectors = ARGV[1].to_i
  num_turns = ARGV[2].to_i

  # Run simulator.
  @simulator = Simulator.new(seed, num_prospectors, num_turns)
  @simulator.play
else
  show_usage
end
