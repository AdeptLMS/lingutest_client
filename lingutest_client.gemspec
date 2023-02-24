# frozen_string_literal: true

require_relative './lib/lingutest_client/version'

Gem::Specification.new do |spec|
  spec.name          = 'lingutest_client'
  spec.version       = LingutestClient::VERSION
  spec.authors       = ['Anatolii Didukh']
  spec.email         = ['railsme7@gmail.com']

  spec.summary       = 'lingutest client'
  spec.description   = 'test.lingu.com API ruby client'
  spec.homepage      = 'https://github.com/AdeptLMS/lingutest_client'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.7.6')

  spec.metadata['rubygems_mfa_required'] = 'true'
  # spec.metadata['allowed_push_host'] = "Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/AdeptLMS/lingutest_client'
  spec.metadata['changelog_uri'] = 'https://github.com/AdeptLMS/lingutest_client/blob/master/CHANGELOG.md'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`
      .split("\x0")
      .reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'dry-configurable', '~> 0.13.0'
  spec.add_dependency 'dry-schema', '~> 1.10.0'
  spec.add_dependency 'dry-struct', '~> 1.5.0'
  spec.add_dependency 'dry-types', '~> 1.6.0'
  spec.add_dependency 'faraday', '~> 1.10.0'
  spec.add_dependency 'faraday_middleware', '~> 1.2.0'
  spec.add_dependency 'zeitwerk', '~> 2.6.7', '>= 2.6.7'
end
