require "yaml"
require "working_man/version"
require "working_man/actions"

module WorkingMan
  
  # Check for configuration file and assign it to @config. If no configuration
  # in ~/.working_man.yml then exit with error code 1
  #
  #
  if File.exists?(File.expand_path('~/.working_man.yml'))
    @config = YAML::load File.open(File.expand_path('~/.working_man.yml'))
  else
    print "No configuration found. Please configure which apps to start in ~/.working_man.yml\n"
    exit(1)
  end

  # Start work calls WorkingMan::Actions#launch_applications, iterating through
  # each app in @config['apps']. It exits if there are no applications with
  # error code 2. If there are no URLs, the program finishes successfully.
  #
  # 
  def self.start_work
    print "Starting work...\n"
    begin
      WorkingMan::Actions.launch_applications(@config['apps'])
    rescue NoMethodError
      p "No applications in configuration"
      exit(2)
    end
    
    begin
      WorkingMan::Actions.open_urls(@config['urls'])
    rescue NoMethodError
    end
    print "Work hard today!\n"
  end
  
  # Stop work iterates through the apps in @config['apps'], stopping each one
  #
  #
  def self.stop_work
    print "Stopping work...\n"
    begin
      WorkingMan::Actions.close_applications(@config['apps'])
    rescue NoMethodError
      p "No applications in configuration"
      exit(2)
    end
    print "Have a great day!\n"
  end
end
