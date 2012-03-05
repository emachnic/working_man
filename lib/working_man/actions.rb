module WorkingMan
  class Actions
    def self.close_applications apps
      apps.each do |app_name|
        `osascript -e "tell application \\"#{app_name}\\" to quit"`
      end
    end

    def self.launch_applications apps
      apps.each do |app_name|
        `open -a "#{app_name}.app"`
      end
    end

    def self.open_urls urls
      urls.each do |url|
        `open #{url}`
      end
    end
  end
end