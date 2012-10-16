# -*- encoding: utf-8 -*-
require File.expand_path('../lib/working_man/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Evan Machnic"]
  gem.email         = ["emachnic@broadmac.net"]
  gem.description   = %q{Start/stop your work apps for the day}
  gem.summary       = %q{Start/stop your work apps for the day}
  gem.homepage      = "http://emachnic.github.com/working_man"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "working_man"
  gem.require_paths = ["lib"]
  gem.version       = WorkingMan::VERSION
  gem.add_development_dependency 'rdoc'
  gem.add_development_dependency 'rake',  '~> 0.9.2'
  gem.add_development_dependency 'aruba', '~> 0.5'
  gem.add_development_dependency 'rspec', '~> 2.9'
  gem.add_dependency 'methadone', '~>1.0.0.rc4'
end
