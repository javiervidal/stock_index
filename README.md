# StockIndex

This gem provides the components of major stock indices in the world. The components are scraped from reference
pages, such as Wikipedia.

## Installation

Add this line to your application's Gemfile:

    gem 'stock_index'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install stock_index

## Supported indices

There is no a standard for indices symbols, so this gem uses Yahoo Finance symbols.

| Symbol | Index Name | Reference page |
| ------ | ---------- | -------------- |
| ^DJI | DOW JONES INDUSTRIAL AVERAGE | http://en.wikipedia.org/wiki/Dow_Jones_Industrial_Average |
| ^GSPC | S&P 500 | http://en.wikipedia.org/wiki/List_of_S%26P_500_companies |
| ^NDX | NASDAQ 100 | http://en.wikipedia.org/wiki/NASDAQ-100 |
| ^N225 | NIKKEI 225 | http://indexes.nikkei.co.jp/en/nkave/index/component?idx=nk225 |
| ^STOXX50E | EURO STOXX 50 | http://www.stoxx.com/indices/index_information.html?symbol=SX5E |
| ^FTSE | FTSE 100 | http://www.londonstockexchange.com/exchange/prices-and-markets/stocks/indices/summary/summary-indices-constituents.html?index=UKX |

## Usage

```ruby
components = StockIndex.new('^DJI').components
```
This method returns an array of components. Each component is a Hash with this format:

```ruby
{
  :market => 'XNYS',
  :symbol => 'MMM',
  :name => '3M CO',
  :wikipedia => 'http://en.wikipedia.org/wiki/3M',
  :cik => '66740',
  :bbgid => 'BBG000BP52R2'
}
```

| Key       | Description |
| ----------| ----------- |
| market    | Market symbol according to [ISO 10383](https://github.com/javiervidal/mic) |
| symbol    | Component symbol |
| name      | Component name according to [Bloomberg Open Symbology](http://bsym.bloomberg.com/sym/) |
| wikipedia | Link to the wikipedia page of the component |
| cik       | Component CIK (Central Index Key) assigned to the company by the SEC |
| bbgid     | BBGID (Bloomberg Security Identifier) according to [Bloomberg Open Symbology](http://bsym.bloomberg.com/sym/)|

The name and cik are obtained querying the [EDGAR database](http://www.sec.gov/edgar/searchedgar/companysearch.html).

The bbgid is obtained from [Bloomberg Open Symbology predefined files](http://bsym.bloomberg.com/sym/).

The name, cik, and bbgid are cached using [PStore](http://ruby-doc.org/stdlib-1.9.2/libdoc/pstore/rdoc/PStore.html).

## Contributing

1. Fork it ( http://github.com/javiervidal/stock_index/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Copyright

Copyright (c) 2014 – ∞ Javier Vidal

## License

This gem is released under the [MIT License](http://opensource.org/licenses/MIT).