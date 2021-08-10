require 'active_record'
require 'active_support/concern'

require 'awesome_print'

module ActiveNotebook
  module Plugins
    module Display
      module AwesomePrint
        extend ::ActiveSupport::Concern

        included do
          match do |obj|
            obj.is_a?(::ActiveRecord::Base) ||
              (obj.is_a?(::ActiveRecord::Relation) && obj.count == 1) || (
              obj.is_a?(Class) && obj.ancestors.include?(::ActiveRecord::Base)
            )
          end
          format 'text/plain' do |obj|
            ::AwesomePrint::Formatter.new(::AwesomePrint::Inspector.new).format(obj)
          end
        end
      end

      add(AwesomePrint)
    end
  end
end

# ActiveNotebook::Plugins::Display.add(ActiveNotebook::Plugins::Display::AwesomePrint)
