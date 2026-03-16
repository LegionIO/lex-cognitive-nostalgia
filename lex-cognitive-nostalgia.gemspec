# frozen_string_literal: true

require_relative 'lib/legion/extensions/cognitive_nostalgia/version'

Gem::Specification.new do |spec|
  spec.name          = 'lex-cognitive-nostalgia'
  spec.version       = Legion::Extensions::CognitiveNostalgia::VERSION
  spec.authors       = ['Esity']
  spec.email         = ['matthewdiverson@gmail.com']

  spec.summary       = 'LEX Cognitive Nostalgia'
  spec.description   = 'Temporal emotional nostalgia bias for LegionIO agents — rosy retrospection, ' \
                       'bittersweet memory detection, and warmth-weighted decision influence'
  spec.homepage      = 'https://github.com/LegionIO/lex-cognitive-nostalgia'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 3.4'

  spec.metadata['homepage_uri']        = spec.homepage
  spec.metadata['source_code_uri']     = 'https://github.com/LegionIO/lex-cognitive-nostalgia'
  spec.metadata['documentation_uri']   = 'https://github.com/LegionIO/lex-cognitive-nostalgia'
  spec.metadata['changelog_uri']       = 'https://github.com/LegionIO/lex-cognitive-nostalgia'
  spec.metadata['bug_tracker_uri']     = 'https://github.com/LegionIO/lex-cognitive-nostalgia/issues'
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ['lib']
  spec.add_development_dependency 'legion-gaia'
end
