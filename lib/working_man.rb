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
    print "Starting work...\n"
    
    WorkingMan::Actions.launch_applications(@@config['apps'])
    WorkingMan::Actions.open_urls(@@config['urls'])

    print "Work hard today!\n"
  end
  
  # Internal: Stop work iterates through the apps in @@config['apps'], stopping
  # each one
  #
  # Examples:
  #
  #   WorkingMan.stop_work
  def self.stop_work
    print "Stopping work...\n"

    WorkingMan::Actions.close_applications(@config['apps'])

    print "Have a great day!\n"
  end
end
