$:.push File.expand_path("../lib", __FILE__)
require "perambulate/version"

Gem::Specification.new do |spec|
  spec.name        = 'perambulate'
  spec.version     = Perambulate::VERSION
  spec.date        = '2012-11-28'
  spec.summary     = "Take addresses as a string.  Get back useful details."
  spec.description = "Perambulate is an address parsing library for natural language addresses.  It provides a broken-down
                      version of a passed address, allowing you to get one input value and do useful things on the chunks."
  spec.authors     = ["Dylan Lacey"]
  spec.email       = 'perambulate@dylanlacey.com'
  spec.files       = `git ls-files`.split("\n")
  spec.homepage    = "http://www.github.com/dylanlacey/Perambulate"


  spec.add_runtime_dependency "lexr", '~> 0.3.1'
  spec.add_runtime_dependency "rake", '~> 0.9.2.2'
  spec.add_runtime_dependency "whittle", '~> 0.0.8'

  spec.add_development_dependency "minitest", '~> 3.3.0'
  spec.add_development_dependency "rspec", '~> 2.10.0'
  spec.add_development_dependency "factory_girl", '~> 4.1.0'

end
