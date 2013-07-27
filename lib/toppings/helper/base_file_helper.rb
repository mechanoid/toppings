module Toppings
  module Helper
    module BaseFileHelper
      extend ActiveSupport::Concern

      included do
        include Toppings::Helper::SassContentHelper
        include Toppings::Helper::SassFileHelper

        self.class.send :attr_writer, :base_name
      end

      private


      def base_path
        @base_path ||= stylesheets_path.join(relative_base_path)
      end

      def relative_base_path
        @relative_base_path ||= Pathname.new(base_name)
      end

      def base_name
        self.class.base_name
      end

      module ClassMethods

        def base_name
          @base_name ||= stripped_class_name.gsub(/Generator$/, '').underscore
        end

        # As base for our naming conventions we want the class name only,
        # without any module space
        def stripped_class_name
          name.demodulize
        end
      end
    end
  end
end