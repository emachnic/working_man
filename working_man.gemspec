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
  gem.post_install_message = <<-END
    Thanks for installing WorkingMan!

    To get started, you'll need a .working_man.yml configuration file in your
    home directory. You can use the following as an example:

    apps:
      - 'Google Chrome'

    urls:
      - 'http://www.ruby-lang.com'

    Please see the documentation at http://emachnic.github.com/working_man for
    more information.
  END

  gem.add_development_dependency 'rdoc'
  gem.add_development_dependency 'rake',  '~> 10.4'
  gem.add_development_dependency 'aruba', '~> 0.10'
  gem.add_development_dependency 'rspec', '~> 3.4'
  gem.add_runtime_dependency     'thor',  '~> 0.19'
end
