Gem::Specification.new do |gem|
  gem.name    = 'eschaton'
  gem.version = '0.0.1'
  gem.summary = 'Eschaton Mapping for Rails.'

  gem.files = Dir['lib/**/*']
  gem.add_dependency 'rails', '3.0.0.beta3'
  gem.add_dependency 'yard', '0.5.4'
  gem.add_dependency 'code_statistics', '0.2.13'
end