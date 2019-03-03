require 'minitest/autorun'
require_relative 'simulator'
# Class that tests ruby_rush class
class RubyRushTest < Minitest::Test
  # UNIT TESTS FOR METHOD validate_args(args) in ruby_rush Class
  # Equivalence classes:
  # args[1] & args[2] = -INFINITY..-1 -> returns nil
  # args[0], args[1] & args[2] = (not a number) -> returns nil
  # args[1] & args[2] = 0 -> returns nil
  # args[1] & args[2] = 1..INFINITY -> returns 1, and runs

  # Test that negative value for prospector_count returns nil
  # EDGE CASE

end
