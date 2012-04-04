require "yaml"
require "working_man/version"
require "working_man/actions"

module WorkingMan
  # Internal: Starts work day by calling WorkingMan::Actions#launch_applications,
  # iterating through each app in @config['apps']. It exits if there are no
  # applications with error code 2. If there are no URLs, the program finishes
  # successfully.
  #
  # Examples:
  #
  #   WorkingMan.start_work
  def self.start_work
    if File.exists?(File.expand_path('~/.working_man.yml'))
      @config = YAML::load(File.open(File.expand_path('~/.working_man.yml')))
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
      return true
    else
      puts "No configuration found. Please configure which apps to start in ~/.working_man.yml."
      exit(1)
    end
  end
  
  # Internal: Stop work iterates through the apps in @config['apps'], stopping
  # each one
  #
  # Examples:
  #
  #   WorkingMan.stop_work
  def self.stop_work
    if File.exists?(File.expand_path('~/.working_man.yml'))
      @config = YAML::load(File.open(File.expand_path('~/.working_man.yml')))
      print "Stopping work...\n"
      begin
        WorkingMan::Actions.close_applications(@config['apps'])
      rescue NoMethodError
        p "No applications in configuration"
        exit(2)
      end
      print "Have a great day!\n"
    else
      puts "No configuration found. Please configure which apps to start in ~/.working_man.yml."
      exit(1)
    end
  end
end
