require 'iruby'

require 'active_notebook/plugins/display'
require 'active_notebook/plugins/display/data_frame'
require 'active_notebook/plugins/display/awesome_print'

module ActiveNotebook
  module Plugins
    class << self
      def load
        Display.plugins.each do |plugin|
          IRuby::Display::Registry.include(plugin)
        end
      end
    end
  end
end
