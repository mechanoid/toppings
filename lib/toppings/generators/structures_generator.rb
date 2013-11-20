# encoding: utf-8
require 'thor/group'

module Toppings
  module Generators
    class StructuresGenerator < Thor::Group
      include Thor::Actions
      include Toppings::Helper::PathHelper
      include Toppings::Helper::BaseFileHelper
      include Toppings::Helper::IndexFileHelper

      argument :type
      argument :name

      def create_component_file
        self.class.base_name = type.pluralize
        template rescued_sass_partial(type), base_path.join(sassy_file_name(name, partial: true))
        create_file index_file_path, skip: true
        append_import name, index_file_path
      end

      private

      def rescued_sass_partial(type)
        File.exists?(self.class.source_root.join(erb_template(type))) ? erb_template(type) : default_template
      end

      def erb_template(type)
        sassy_file_name(type, type: :erb, partial: true)
      end

      def default_template
        sassy_file_name('default', type: :erb, partial: true)
      end

      class << self
        def source_root
          template_path.join('components')
        end
      end

    end
  end
end
