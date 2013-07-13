module Toppings
  module Helper
    module BaseFileHelper
      extend ActiveSupport::Concern

      included do
        include Toppings::Helper::SassContentHelper
        include Toppings::Helper::SassFileHelper
      end

      private

      def group_base_name
        relative_base_path.join("base")
      end

      def base_file_path
        base_path.join(base_file_name)
      end

      def base_path
        @base_path ||= stylesheets_path.join(relative_base_path)
      end

      def base_file_name
        # TODO: make base file name configurable
        sassy_file_name "base"
      end

      def base_name
        self.class.base_name
      end

      def relative_base_path
        @relative_base_path ||= Pathname.new(base_name)
      end

      module ClassMethods
        def base_name=(name)
          @base_name = name
        end

        def base_name
          @base_name ||= stripped_class_name.gsub(/Generator$/, '').underscore
        end

        def stripped_class_name
          name.demodulize
        end
      end
    end
  end
end