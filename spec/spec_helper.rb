# frozen_string_literal: true

require 'bundler/setup'

module Legion
  module Logging
    def self.debug(_msg); end
    def self.info(_msg); end
    def self.warn(_msg); end
    def self.error(_msg); end
  end
end

require 'legion/extensions/cognitive_nostalgia/helpers/constants'
require 'legion/extensions/cognitive_nostalgia/helpers/nostalgic_memory'
require 'legion/extensions/cognitive_nostalgia/helpers/nostalgia_event'
require 'legion/extensions/cognitive_nostalgia/helpers/nostalgia_engine'
require 'legion/extensions/cognitive_nostalgia/runners/recall'
require 'legion/extensions/cognitive_nostalgia/runners/analysis'
require 'legion/extensions/cognitive_nostalgia/client'

RSpec.configure do |config|
  config.example_status_persistence_file_path = '.rspec_status'
  config.disable_monkey_patching!
  config.expect_with(:rspec) { |c| c.syntax = :expect }
end
