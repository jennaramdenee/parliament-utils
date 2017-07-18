# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'parliament/utils/version'

Gem::Specification.new do |spec|
  spec.name          = 'parliament-utils'
  spec.version       = Parliament::Utils::VERSION
  spec.authors       = ['Rebecca Appleyard']
  spec.email         = ['rklappleyard@gmail.com']

  spec.summary       = %q{Parliament Utils gem.}
  spec.description   = %q{Parliament Utils gem.}
  spec.homepage      = 'http://github.com/ukparliament/parliament-utils'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'parliament-ruby', '~> 0.7'
  spec.add_dependency 'parliament-grom-decorators', '~> 0.2'
  spec.add_dependency 'parliament-ntriple'
  spec.add_dependency 'i18n'
  spec.add_dependency 'vcard'
  spec.add_dependency 'coveralls'
  spec.add_dependency 'simplecov'
  spec.add_dependency 'bandiera-client'

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'vcr', '~> 3.0'
  spec.add_development_dependency 'simplecov', '~> 0.12'
  spec.add_development_dependency 'webmock', '~> 2.3'
end
