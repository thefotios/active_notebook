# lib/railtie.rb
module ActiveNotebook
  class Railtie < ::Rails::Railtie
    rake_tasks do
      path = File.expand_path(__dir__)
      Dir.glob("#{path}/railtie/**/*.rake").each { |f| load f }
    end
  end
end
