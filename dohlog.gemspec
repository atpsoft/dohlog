require 'rake'

Gem::Specification.new do |s|
  s.name = 'dohlog'
  s.version = '0.2.7'
  s.summary = 'simple logging framework'
  s.description = 'Logging framework built to be fast and flexible.'
  s.require_path = 'lib'
  s.required_ruby_version = '>= 2.2.0'
  s.add_runtime_dependency 'dohutil', '~> 0.2', '>= 0.2.29'
  s.add_development_dependency 'dohtest', '~> 0.1', '>= 0.1.48'
  s.authors = ['ATPSoft']
  s.bindir = 'bin'
  s.homepage = 'https://github.com/atpsoft/dohlog'
  s.license = 'MIT'
  s.email = ['devinfo@atpsoft.com']
  s.extra_rdoc_files = ['MIT-LICENSE']
  s.test_files = FileList["{test}/**/*.rb"].to_a
  s.files = FileList["{lib}/**/*"].to_a
end
