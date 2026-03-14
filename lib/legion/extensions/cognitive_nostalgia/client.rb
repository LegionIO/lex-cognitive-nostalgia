# frozen_string_literal: true

require 'legion/extensions/cognitive_nostalgia/helpers/constants'
require 'legion/extensions/cognitive_nostalgia/helpers/nostalgic_memory'
require 'legion/extensions/cognitive_nostalgia/helpers/nostalgia_event'
require 'legion/extensions/cognitive_nostalgia/helpers/nostalgia_engine'
require 'legion/extensions/cognitive_nostalgia/runners/recall'
require 'legion/extensions/cognitive_nostalgia/runners/analysis'

module Legion
  module Extensions
    module CognitiveNostalgia
      class Client
        include Runners::Recall
        include Runners::Analysis

        def initialize(engine: nil)
          @nostalgia_engine = engine || Helpers::NostalgiaEngine.new
        end

        private

        attr_reader :nostalgia_engine
      end
    end
  end
end
