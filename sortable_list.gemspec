$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "sortable_list/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "sortable_list"
  s.version     = SortableList::VERSION
  s.authors     = ["Tom Maeckelberghe"]
  s.email       = ["tom.maeckelberghe@gmail.com"]
  s.homepage    = "https://www.qmusic.be"
  s.summary     = "Easy table sorting for bootstrap/fontawesome projects"
  s.description = "Needs bootstrap and fontawesome"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "> 3.2.0"

  s.add_development_dependency "sqlite3"
end
