require 'simplecov'
require 'coveralls'

SimpleCov.formatters = [SimpleCov::Formatter::HTMLFormatter, Coveralls::SimpleCov::Formatter]

SimpleCov.start

require 'stock_index'
require 'webmock/rspec'

WebMock.disable_net_connect!(allow: 'coveralls.io')

RSpec.configure do |config|
  config.before(:each) do

    stub_request(:get, "http://en.wikipedia.org/wiki/Dow_Jones_Industrial_Average").
      with(:headers => {'Accept' => '*/*'}).
      to_return(:status => 200, :body => fixture_html('dji'), :headers => {})

    stub_request(:get, "http://en.wikipedia.org/wiki/List_of_S&P_500_companies").
      with(:headers => {'Accept' => '*/*'}).
      to_return(:status => 200, :body => fixture_html('gspc'), :headers => {})

    stub_request(:get, "http://en.wikipedia.org/wiki/NASDAQ-100").
      with(:headers => {'Accept' => '*/*'}).
      to_return(:status => 200, :body => fixture_html('ndx'), :headers => {})

    stub_request(:get, "http://indexes.nikkei.co.jp/en/nkave/index/component?idx=nk225").
      with(:headers => {'Accept' => '*/*'}).
      to_return(:status => 200, :body => fixture_html('n225'), :headers => {})

    stub_request(:get, "http://en.wikipedia.org/wiki/Nikkei_225").
      with(:headers => {'Accept' => '*/*'}).
      to_return(:status => 200, :body => fixture_html('n225_wikipedia'), :headers => {})

  end
end

def fixture_path
  File.expand_path('../fixtures', __FILE__)
end

def fixture_yaml(symbol)
  File.new(File.join(fixture_path, 'yaml', yaml_file(symbol)))
end

def fixture_html(page)
  File.new(File.join(fixture_path, 'html', "#{page}.html"))
end

def yaml_file(symbol)
  md = /\^(\w+)/.match(symbol)
  "#{md[1]}.yaml"
end

def components_from_fixture(symbol)
  YAML::load_file(fixture_yaml(symbol))
end