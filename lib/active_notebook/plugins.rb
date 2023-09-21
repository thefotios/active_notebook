module ActiveNotebook::Plugins
  autoload(:Rails, 'active_notebook/plugins/rails')
  autoload(:Postgres, 'active_notebook/plugins/postgres')
  autoload(:Display, 'active_notebook/plugins/display')

  class << self
    def pre_boot
      Display.call
    end

    def post_boot
      Rails.call
      Postgres.call
    end
  end
end
