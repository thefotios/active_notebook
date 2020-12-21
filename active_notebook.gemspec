lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_notebook/version'

Gem::Specification.new do |spec|
  spec.name = 'active_notebook'
  spec.version = ActiveNotebook::VERSION
  spec.authors = ['Fotios Lindiakos']
  spec.email = ['fotios.lindiakos@gmail.com']

  spec.summary = 'Write a short summary, because RubyGems requires one.'
  # spec.description   = 'TODO: Write a longer description or delete this line.'
  spec.homepage = 'http://github.com/thefotios/active_notebook'
  spec.license = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir['lib/**/*.rb']
  spec.bindir = 'exe'
  spec.executables = ['active_notebook']

  spec.add_dependency 'awesome_print', '~> 1.8'
  spec.add_dependency 'daru', '~> 0.3'
  spec.add_dependency 'ffi-rzmq', '~> 2.0'
  spec.add_dependency 'iruby', '~> 0.4'

  spec.add_development_dependency 'pry', '~> 0.13.1'
end
