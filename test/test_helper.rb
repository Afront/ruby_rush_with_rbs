$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "ruby_rush"
require 'simplecov'
SimpleCov.start

include RubyRush

require "minitest/autorun"
