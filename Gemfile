source "https://rubygems.org"

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

# Specify your gem's dependencies in active_notebook.gemspec
gemspec

gem 'iruby', git: 'https://github.com/SciRuby/iruby.git'
gem "attr_extras", require: "attr_extras/explicit"
gem 'daru'

group :development do
  gem 'pry'
end
