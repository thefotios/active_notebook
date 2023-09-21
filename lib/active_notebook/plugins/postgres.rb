class ActiveNotebook::Plugins::Postgres
  extend AttrExtras.mixin

  module Sandbox
    # Shamelessly adapted from https://github.com/salsify/safer_rails_console/blob/master/lib/safer_rails_console/patches/sandbox/auto_rollback.rb
    def execute_and_clear(sql, name, binds, prepare: false)
      super
    rescue StandardError => exception
      unless exception.message.include?('PG::ReadOnlySqlTransaction')
        connection = ::ActiveRecord::Base.connection
        connection.rollback_db_transaction
        connection.begin_db_transaction
      end

      raise exception
    end
  end

  method_object

  def call
    require 'active_record'
    ::ActiveRecord::ConnectionAdapters::PostgreSQLAdapter.prepend(Sandbox)
  end
end
