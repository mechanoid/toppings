require 'thor/group'

module Toppings
  module Generators
    module Setup
      class BaseGenerator < Thor::Group
        include Thor::Actions
        include Toppings::Helper::PathHelper
        include Toppings::Helper::BaseFileHelper

        def notify_invoke
          say "invoke Setup::#{self.class.stripped_class_name}"
        end

        def self.source_root
          template_path
        end

      end
    end
  end
end
