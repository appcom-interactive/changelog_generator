# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'git_changelog_generator/version'

Gem::Specification.new do |spec|
  spec.name          = "git_changelog_generator"
  spec.version       = GitChangelogGenerator::VERSION
  spec.authors       = ["Stefan Neidig"]
  spec.email         = ["s.neidig@appcom-interactive.de"]

  spec.summary       = %q{This is a gem for creating changelogs from git version history.}
  spec.description   = %q{This is a gem for creating changelogs from git version history.}
  spec.homepage      = "https://github.com/appcom-interactive/changelog_generator"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_runtime_dependency('gli','2.14.0')
end
