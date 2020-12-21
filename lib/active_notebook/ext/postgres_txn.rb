# Shamelessly adapted from https://github.com/salsify/safer_rails_console/blob/master/lib/safer_rails_console/patches/sandbox/auto_rollback.rb
module ActiveNotebook
  module Ext
    module PostgresTXN
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
  end
end
