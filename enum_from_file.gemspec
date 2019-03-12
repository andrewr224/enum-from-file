$:.push File.expand_path("lib", __dir__)

require "enum_from_file/version"

Gem::Specification.new do |spec|
  spec.name        = "enum_from_file"
  spec.version     = EnumFromFile::VERSION
  spec.authors     = ["andrew_r"]
  spec.email       = ["andrew.r224@gmail.com"]
  spec.homepage    = "https://github.com/andrewr224/enum-from-file"
  spec.summary     = "Load Rails enums from files!"
  spec.description = "Add `from_file` option to Rails enum."
  spec.license     = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", ">= 4.2.0"

  spec.add_development_dependency "sqlite3", "~> 1.3.6"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "pry-rails"
  spec.add_development_dependency "rubocop"
end
