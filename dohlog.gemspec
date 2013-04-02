require 'rake'

Gem::Specification.new do |s|
  s.name = 'dohlog'
  s.version = '0.2.0'
  s.summary = 'simple logging framework'
  s.description = 'Logging framework built to be fast and flexible.'
  s.require_path = 'lib'
  s.required_ruby_version = '>= 1.9.2'
  s.add_runtime_dependency 'dohutil', '>= 0.2.3'
  s.authors = ['Makani Mason', 'Kem Mason']
  s.bindir = 'bin'
  s.homepage = 'https://github.com/atpsoft/dohlog'
  s.license = 'MIT'
  s.email = ['devinfo@atpsoft.com']
  s.extra_rdoc_files = ['MIT-LICENSE']
  s.files = files = FileList["{lib}/**/*"].to_a
end
