# encoding: utf-8
module Toppings
  module Generators
    module Install
      class CompassConfigGenerator < BaseGenerator
        class << self
          def source_root
            template_path
          end
        end

        def compass_config
          template 'compass.rb.tt', Pathname.new('.').join('config').join('compass.rb')
        end
      end
    end
  end
end
