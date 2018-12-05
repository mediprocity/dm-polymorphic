# coding: utf-8
# frozen_string_literal: true
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name             = "dm-polymorphic"
  s.version          = "1.2.4"
  s.platform         = Gem::Platform::RUBY
  s.extra_rdoc_files = %w[ README.textile LICENSE TODO ]
  s.summary          = "DataMapper plugin enabling simple ActiveRecord style polymorphism"
  s.description      = s.summary
  s.author           = "Daniel Neighman, Wayne E. Seguin, Ripta Pasay, Martin Linkhorst"
  s.email            = "has.sox@gmail.com, wayneeseguin@gmail.com, github@r8y.org, m.linkhorst@googlemail.com"
  s.homepage         = "http://github.com/hassox/dm-polymorphic"
  s.require_path     = "lib"
  s.add_dependency("dm-core", ">=1.2.1")
  s.add_dependency("activesupport", "~> 5.1")
  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if s.respond_to?(:metadata)
    s.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  s.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  s.bindir        = 'exe'
  s.executables   = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.required_ruby_version = '~> 2.3'
end
