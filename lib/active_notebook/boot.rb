require 'pry'
require 'active_record/type'

class ActiveNotebook::Boot
  extend AttrExtras.mixin

  method_object

  def call
    require 'iruby'

    IRuby::Kernel.events.register(:initialized) do |kernel|
      kernel.switch_backend!(:pry)
      ActiveNotebook::Plugins.post_boot
    end

    ActiveNotebook::Plugins.pre_boot
  end
end

