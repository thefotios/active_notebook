
module ActiveNotebook
  module Plugins
    module Display
      class << self
        def plugins
          @plugins ||= Set.new
        end

        def add(plugin)
          plugins << plugin
        end
      end
    end
  end
end
