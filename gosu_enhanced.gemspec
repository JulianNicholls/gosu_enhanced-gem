# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gosu_enhanced/version'

Gem::Specification.new do |spec|
  spec.name          = 'gosu_enhanced'
  spec.version       = GosuEnhanced::VERSION
  spec.authors       = ['Julian Nicholls']
  spec.email         = ['juliannicholls29@gmail.com']
  spec.summary       = 'Extra and enhanced versions of some Gosu classes.'
  spec.description   = %(Point, Size, and Region classes to hold pixel
co-ordinates and rectangle sizes respectively. An updated window class to draw
rectangles and lines in a single colour more easily. Updated font class to
measure text and return co-ordinates to centre a piece of text in a rectangle
size.)
  spec.homepage      = 'https://github.com/JulianNicholls/gosu_enhanced-gem'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'gosu', '~> 0.14.5'

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'minitest', '~> 5.8'
end
