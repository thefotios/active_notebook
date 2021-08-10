module ActiveNotebook
  module Boot
    def self.run
      require 'iruby'

      IRuby::Kernel.events.register(:initialized) do |_kernel|
        require 'active_notebook/kernel'
        require 'active_record/type'

        ActiveNotebook::Kernel.new(
          sandbox: ::ActiveRecord::Type::Boolean.new.cast(ENV['SANDBOX'])
        ).run
      end

      require 'active_notebook/plugins'
      ActiveNotebook::Plugins.load
    end
  end
end

ActiveNotebook::Boot.run
