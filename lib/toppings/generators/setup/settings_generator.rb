module Toppings
  module Generators
    module Setup
      class SettingsGenerator < GroupGenerator

        SETTINGS_FILES = %w{colors shadows borders typography}

        def create_setting_files
          SETTINGS_FILES.each { |file| group_template_file file }
        end

      end
    end
  end
end
