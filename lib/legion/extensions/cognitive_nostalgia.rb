# frozen_string_literal: true

require 'legion/extensions/cognitive_nostalgia/version'
require 'legion/extensions/cognitive_nostalgia/helpers/constants'
require 'legion/extensions/cognitive_nostalgia/helpers/nostalgic_memory'
require 'legion/extensions/cognitive_nostalgia/helpers/nostalgia_event'
require 'legion/extensions/cognitive_nostalgia/helpers/nostalgia_engine'
require 'legion/extensions/cognitive_nostalgia/runners/recall'
require 'legion/extensions/cognitive_nostalgia/runners/analysis'

module Legion
  module Extensions
    module CognitiveNostalgia
      extend Legion::Extensions::Core if Legion::Extensions.const_defined? :Core
    end
  end
end
