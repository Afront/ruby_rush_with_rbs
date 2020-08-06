$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "ruby_rush"
require 'simplecov'
SimpleCov.start

require "minitest/autorun"
