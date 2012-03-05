require 'bundler'
require 'rake/clean'
require 'rake/testtask'
gem 'rdoc' # we need the installed RDoc gem, not the system one
require 'rdoc/task'

include Rake::DSL

Bundler::GemHelper.install_tasks

Rake::TestTask.new do |t|
  t.pattern = 'test/tc_*.rb'
end

Rake::RDocTask.new do |rd|
  
  rd.main = "README.rdoc"
  
  rd.rdoc_files.include("README.rdoc","lib/**/*.rb","bin/**/*")
end

task :default => [:test,:features]
