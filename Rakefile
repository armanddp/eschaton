require 'rake'
require 'yard'
require 'rake/testtask'
require 'rake/rdoctask'
require 'rake/gempackagetask'
require 'code_statistics'
  
PKG_FILES = FileList[
  '[a-zA-Z]*',
  'generators/**/*',
  'lib/**/*',
  'rails/**/*',
  'tasks/**/*',
  'test/**/*'
]

spec = Gem::Specification.new do |s|
  s.name    = 'eschaton'
  s.version = '0.0.1'
  s.platform = Gem::Platform::RUBY
  s.summary = "Eschaton Mapping Goodness"
  s.description = "Eschaton Mapping Goodness"
  s.files = PKG_FILES.to_a
  s.require_path = "lib"
  s.has_rdoc = false
end

desc 'Turn this plugin into a gem.'
Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end
