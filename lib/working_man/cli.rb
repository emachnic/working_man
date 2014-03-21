require 'thor'

module WorkingMan
  class CLI < Thor
    require 'working_man/cli/config'

    class_option :file, default: '~/.working_man.yml', aliases: '-f'

    desc 'start', 'Starts your work day'
    def start
      configuration_check(options[:file])

      print "Staring work...\n"

      WorkingMan::Actions.launch_applications($config['apps'])
      WorkingMan::Actions.open_urls($config['urls'])

      print "Work hard today!\n"
    end

    desc 'stop', 'Stop working and go home!'
    def stop
      configuration_check(options[:file])

      print "Stopping work...\n"

      WorkingMan::Actions.close_applications($config['apps'])

      print "Have a great day!\n"
    end

    desc 'version', 'Print the version'
    def version
      print "#{WorkingMan::VERSION}\n"
    end
    map ['-v', '--version'] => :version

    private
    def configuration_check(file)
      config_path = File.expand_path(file)
      WorkingMan::CLI::Config.check_config(config_path)
    end
  end
end
