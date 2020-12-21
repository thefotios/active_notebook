require 'active_notebook/plugins'
require 'active_notebook/ext/postgres_txn'

module ActiveNotebook
  # Based on https://github.com/Yuki-Inoue/jupyter_on_rails/blob/master/lib/jupyter_on_rails/kernel.rb
  module IRubyKernelExtension
    def run
      load_rails
      ActiveNotebook::Plugins.load
      # prepare_sandbox
      # register_ext

      super
    end

    private

    def load_rails
      rails_root = Dir.pwd

      require File.expand_path('config/boot.rb', rails_root)

      require File.expand_path('config/environment.rb', rails_root)
      Rails.application.require_environment!
    end

    def prepare_sandbox
      ::ActiveRecord::ConnectionAdapters::PostgreSQLAdapter.prepend(ActiveNotebook::Ext::PostgresTXN)

      # Run the whole thing in a sandbox
      if ActiveRecord::Type::Boolean.new.cast(ENV['SANDBOX'])
        ActiveRecord::Base.connection.begin_transaction(joinable: false)
        at_exit do
          ActiveRecord::Base.connection.rollback_transaction
        end
      end
    end
  end
end
