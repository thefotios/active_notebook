require 'active_notebook/version'

module ActiveNotebook
  class Error < StandardError; end
end

require 'active_notebook/railtie' if defined?(Rails)
