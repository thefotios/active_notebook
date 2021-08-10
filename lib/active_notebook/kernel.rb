module ActiveNotebook
  Kernel = Struct.new(:sandbox, :rails_root, keyword_init: true) do
    def run
      require 'active_notebook/ext/postgres_txn'
      require 'iruby/rails'

      IRuby.load_rails(nil, sandbox, rails_root)
      prepare_sandbox
    end

    private

    def prepare_sandbox
      ::ActiveRecord::ConnectionAdapters::PostgreSQLAdapter.prepend(ActiveNotebook::Ext::PostgresTXN)
    end
  end
end
