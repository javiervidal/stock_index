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

    stub_request(:get, "http://www.sec.gov/cgi-bin/browse-edgar?CIK=CSCO&action=getcompany").
      with(:headers => {'Accept' => '*/*'}).
      to_return(:status => 200, :body => edgar_html, :headers => {})

    stub_request(:get, "http://www.sec.gov/cgi-bin/browse-edgar?CIK=ZZZZ&action=getcompany").
      with(:headers => {'Accept' => '*/*'}).
      to_return(:status => 200, :body => "", :headers => {})

    stub_request(:get, "http://www.londonstockexchange.com/exchange/prices-and-markets/stocks/indices/summary/summary-indices-constituents.html?index=UKX&page=1").
      with(:headers => {'Accept' => '*/*'}).
      to_return(:status => 200, :body => fixture_html_ftse(1), :headers => {})

    stub_request(:get, "http://www.londonstockexchange.com/exchange/prices-and-markets/stocks/indices/summary/summary-indices-constituents.html?index=UKX&page=2").
      with(:headers => {'Accept' => '*/*'}).
      to_return(:status => 200, :body => fixture_html_ftse(2), :headers => {})

    stub_request(:get, "http://www.londonstockexchange.com/exchange/prices-and-markets/stocks/indices/summary/summary-indices-constituents.html?index=UKX&page=3").
      with(:headers => {'Accept' => '*/*'}).
      to_return(:status => 200, :body => fixture_html_ftse(3), :headers => {})

    stub_request(:get, "http://www.londonstockexchange.com/exchange/prices-and-markets/stocks/indices/summary/summary-indices-constituents.html?index=UKX&page=4").
      with(:headers => {'Accept' => '*/*'}).
      to_return(:status => 200, :body => fixture_html_ftse(4), :headers => {})

    stub_request(:get, "http://www.londonstockexchange.com/exchange/prices-and-markets/stocks/indices/summary/summary-indices-constituents.html?index=UKX&page=5").
      with(:headers => {'Accept' => '*/*'}).
      to_return(:status => 200, :body => fixture_html_ftse(5), :headers => {})

    stub_request(:get, "http://www.londonstockexchange.com/exchange/prices-and-markets/stocks/indices/summary/summary-indices-constituents.html?index=UKX&page=6").
      with(:headers => {'Accept' => '*/*'}).
      to_return(:status => 200, :body => fixture_html_ftse(6), :headers => {})

    stub_request(:get, "http://en.wikipedia.org/wiki/FTSE_100_Index").
      with(:headers => {'Accept' => '*/*'}).
      to_return(:status => 200, :body => fixture_html('ftse_wikipedia'), :headers => {})

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

def edgar_html
  File.new(File.join(fixture_path, 'html', "edgar.html"))
end

def fixture_html_ftse(page)
  File.new(File.join(fixture_path, 'html', "ftse_#{page}.html"))
end