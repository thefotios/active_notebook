require 'daru'

module ActiveNotebook
  module Plugins
    module Display
      module DataFrame
        extend ActiveSupport::Concern

        included do
          type { ActiveRecord::Relation }
          format 'text/html' do |obj|
            Daru::DataFrame.from_activerecord(obj).set_index(:id).to_html
          end
        end
      end
    end
  end
end
