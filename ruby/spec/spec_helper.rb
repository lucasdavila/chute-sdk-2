#we need the actual library file
require_relative '../lib/chute'
# For Ruby < 1.9.3, use this instead of require_relative
# require(File.expand_path('../../lib/chute', __FILE__))

#dependencies

require 'minitest/autorun'
require 'webmock/minitest'
require 'vcr'

#VCR config
VCR.config do |c|
  c.cassette_library_dir = 'spec/fixtures/chute_cassettes'
  c.stub_with :webmock
end
