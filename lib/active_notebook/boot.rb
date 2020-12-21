require 'iruby'

require 'active_notebook/iruby_kernel_extension'

module ActiveNotebook
  module Boot
    def self.run
      IRuby.logger.warn('Booting')
      IRuby::Kernel.prepend(ActiveNotebook::IRubyKernelExtension)
    end
  end
end

ActiveNotebook::Boot.run
