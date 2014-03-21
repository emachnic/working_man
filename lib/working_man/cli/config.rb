require 'yaml'

module WorkingMan
  class CLI
    class Config
      # Internal: Checks for a configuration file. If one is not found, message
      # is printed to the console and system exits with status code "1"
      #
      # Examples:
      #
      #   check_config(config_path)
      #
      # Returns true if everything passes
      def self.check_config(config_path)
        if File.exists?(config_path)
          check_config_format(config_path)
          return true
        else
          puts "No configuration found. Please configure which apps to start in #{config_path}"
          exit 1
        end
      end

      # Internal: Checks the format of the configuration file. If the configuration
      # is blank, exits with status "2". If there are no apps, exits with status "3"
      # If there are no URLs, prints a warning but continues with execution.
      #
      # Examples:
      #
      #   check_config_format(config_path)
      #
      # Returns true if everything passes
      def self.check_config_format(config_path)
        $config = YAML::load(File.open(config_path))

        if !$config
          p "Nothing in configuration. Exiting..."
          exit 2
        elsif !$config['apps']
          p "No applications in configuration. Exiting..."
          exit 2
        elsif !$config['urls']
          p "WARN: No URLs in configuration"
          return true
        end
      end
    end
  end
end
