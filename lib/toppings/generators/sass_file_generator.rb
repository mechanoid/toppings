require 'thor/group'

module Toppings
  module Generators
    class SassFileGenerator < Thor::Group
      include Thor::Actions
      include Toppings::Helper::SassConversionHelper
      include Toppings::Helper::SassFileHelper

      argument :file_name
      class_option :target_path
      class_option :source_root
      class_option :standalone

      class << self
        # TODO: Crappy solution i know :/ Find out if this can be achieved better with thor board functionality
        def source_root
          @current_source_root
        end

        # TODO: Crappy solution (Part II) i know :/ Find out if this can be achieved better with thor board functionality
        def source_root=(source_root)
          @current_source_root = source_root
        end
      end

      def set_current_source_root
        self.class.source_root = options[:source_root]
      end

      def create_file_from_template
        template sassy_file_name(file_name, dialect: Toppings.conf.sass.template_dialect), file_path(file_name) do |content|
          content if valid_sass?(content)
          Toppings.conf.sass.dialect == 'scss' ? convert_to_scss(content) : content
        end
      end

      private

      def file_path(file_name)
        base_path.join(sassy_file_name(file_name))
      end

      def base_path
        options[:target_path]
      end
    end
  end
end
