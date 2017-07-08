$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "my_responders/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "my_responders"
  s.version     = MyResponders::VERSION
  s.authors     = ["moeabdol"]
  s.email       = ["mohd.a.saed@gmail.com"]
  s.homepage    = ""
  s.summary     = "Summary of MyResponders."
  s.description = "Description of MyResponders."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.2"
  s.add_dependency "responders"

  s.add_development_dependency "sqlite3"
end
