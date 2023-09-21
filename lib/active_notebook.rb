require "attr_extras/explicit"
require 'active_notebook/version'

module ActiveNotebook
  class Error < StandardError; end

  autoload(:Boot, 'active_notebook/boot')
  autoload(:Plugins, 'active_notebook/plugins')
end

require 'active_notebook/railtie' if defined?(Rails)
