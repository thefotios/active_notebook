require 'daru'
require 'active_support/concern'

class ActiveNotebook::Plugins::Display
  module DataFrame
    extend ::ActiveSupport::Concern

    included do
      type { ::ActiveRecord::Relation }
      format 'text/html' do |obj|
        ::Daru::DataFrame
          .from_activerecord(obj)
          .tap do |df|
            df.set_index(:id) if :id.in?(df.vectors)
          end.to_html
      end
      priority 10
    end
  end

  add(DataFrame)
end
