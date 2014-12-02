require 'simplecov'
require 'coveralls'

SimpleCov.formatters = [SimpleCov::Formatter::HTMLFormatter, Coveralls::SimpleCov::Formatter]

SimpleCov.start

require 'stock_index'

def fixture_path
  File.expand_path('../fixtures', __FILE__)
end

def fixture(symbol)
  File.new(fixture_path + '/' + file(symbol))
end

def file(symbol)
  md = /\^(\w+)/.match(symbol)
  "#{md[1]}.yaml"
end

def components_from_fixture(symbol)
  YAML::load_file(fixture(symbol))
end