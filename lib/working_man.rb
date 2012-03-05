require "yaml"
require "working_man/version"
require "working_man/actions"

module WorkingMan
  @config = YAML::load(File.open('config/setup.yml'))
   
  def self.start_work
    WorkingMan::Actions.launch_applications(@config['apps'])
    WorkingMan::Actions.open_urls(@config['urls'])
  end
  
  def self.stop_work
    WorkingMan::Actions.close_applications(@config['apps'])
  end
end
