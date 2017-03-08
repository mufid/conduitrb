Gem::Specification.new do |s|

  s.name        = 'conduitrb'
  s.version     = '0.1.1'
  s.date        = '2017-03-08'
  s.summary     = "db-refresher"
  s.description = "Dynamically-typed Phabricator API for Ruby"
  s.authors     = ["Mufid Afif"]
  s.email       = 'mufid@outlook.com'
  s.files       = [
    'conduitrb.gemspec',
  ].concat( Dir.glob('lib/**/*').reject {|f| File.directory?(f) || f =~ /~$/ } )
  # s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.homepage    = 'https://github.com/mufid/conduitrb'
  s.license     = 'MIT'

  s.add_development_dependency 'bundler', '~> 1.11'
  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency 'pry'
end
