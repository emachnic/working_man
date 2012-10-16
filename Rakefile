require 'bundler'
require 'rake/clean'
gem 'rdoc' # we need the installed RDoc gem, not the system one
require 'rdoc/task'
require 'rspec/core/rake_task'
require 'cucumber/rake/task'

include Rake::DSL

Bundler::GemHelper.install_tasks

desc 'Run specs'
RSpec::Core::RakeTask.new :spec do |t|

end

CUKE_RESULTS = 'results.html'
CLEAN << CUKE_RESULTS
Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features --format html -o #{CUKE_RESULTS} --format pretty --no-source -x"
  t.fork = false
end

Rake::RDocTask.new do |rd|
  
  rd.main = "README.rdoc"
  
  rd.rdoc_files.include("README.rdoc","lib/**/*.rb","bin/**/*")
end

task :default => [:features]
