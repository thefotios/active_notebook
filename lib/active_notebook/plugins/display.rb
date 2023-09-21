class ActiveNotebook::Plugins::Display
  extend AttrExtras.mixin

  class << self
    def plugins = @plugins ||= Set.new
    def add(plugin) = plugins << plugin
  end

  method_object

  def call
    require_relative 'display/awesome_print'
    require_relative 'display/data_frame'

    self.class.plugins.each do |plugin|
      IRuby::Display::Registry.include(plugin)
    end
  end
end
