Gem::Specification.new do |s|
  s.name        = 'assured-runner'
  s.version     = '0.0.1'
  s.date        = '2012-08-31'
  s.summary     = "Rest-assured runner"
  s.description = "Runner for REST-assured that loads double responses from the filesystem using a YAML config"
  s.authors     = ["Robert Kenny"]
  s.email       = 'robert.kenny@bbc.co.uk'
  s.files       = ["lib/assured-runner.rb"]
  s.homepage    = 'https://github.com/kenoir/assured-runner-gem'
  s.add_dependency 'rest-assured', '>= 1.1.9'
  s.add_dependency 'rest-client', '>= 1.6.7'
end
