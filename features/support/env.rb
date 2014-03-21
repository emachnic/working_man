require 'aruba/cucumber'

ENV['PATH'] = "#{File.expand_path(File.dirname(__FILE__) + '/../../bin')}#{File::PATH_SEPARATOR}#{ENV['PATH']}"
LIB_DIR = File.join(File.expand_path(File.dirname(__FILE__)),'..','..','lib')

Before do
  # Increase timeout for Aruba
  @aruba_timeout_seconds = 30

  # Using "announce" causes massive warnings on 1.9.2
  @puts = true
  @original_rubylib = ENV['RUBYLIB']
  ENV['RUBYLIB'] = LIB_DIR + File::PATH_SEPARATOR + ENV['RUBYLIB'].to_s

  # Setup fake home directory in /tmp/fakehome before tests
  @real_home = ENV['HOME']
  ENV['HOME'] = '/tmp/fakehome'
  FileUtils.rm_rf '/tmp/fakehome'
  FileUtils.mkdir '/tmp/fakehome'
end

After do
  ENV['RUBYLIB'] = @original_rubylib
  ENV['HOME'] = @real_home
end
