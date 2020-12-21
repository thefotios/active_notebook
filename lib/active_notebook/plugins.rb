require 'iruby'

require 'active_notebook/plugins/display/data_frame'
require 'active_notebook/plugins/display/awesome_print'

module ActiveNotebook
  module Plugins
    module Display; end

    DISPLAY_PLUGINS = [
      ActiveNotebook::Plugins::Display::AwesomePrint,
      ActiveNotebook::Plugins::Display::DataFrame,
    ].freeze

    def self.load
      DISPLAY_PLUGINS.each do |plugin|
        IRuby::Display::Registry.include(plugin)
      end
    end
  end
end

