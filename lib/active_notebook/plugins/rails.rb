class ActiveNotebook::Plugins::Rails
  extend AttrExtras.mixin

  method_object

  def call
    root = Pathname.new(ENV['RAILS_ROOT'] ||= Dir.pwd)
    sandbox = ::ActiveRecord::Type::Boolean.new.cast(ENV['SANDBOX'])

    load_rails(root).tap do |app|
      app.sandbox = sandbox
    end
    setup_console_methods
  end

  private

  def load_rails(root)
    ENV['RAILS_ENV'] ||= 'development'

    IRuby.logger.warn("Loading rails: #{root}")
    Dir.chdir(root) do
      require root / 'config/application'
    end

    ::Rails.application.tap(&:require_environment!)
  end

  def setup_console_methods
    require 'rails/console/app'
    IRuby::Kernel
      .instance
      .instance_variable_get(:@backend)
      .instance_variable_get(:@main)
      .extend(Rails::ConsoleMethods)
  end
end
