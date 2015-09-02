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

| Symbol | Index Name | Reference pages |
| ------ | ---------- | -------------- |
| ^DJI | DOW JONES INDUSTRIAL AVERAGE | https://en.wikipedia.org/wiki/Dow_Jones_Industrial_Average |
| ^GSPC | S&P 500 | https://en.wikipedia.org/wiki/List_of_S%26P_500_companies |
| ^NDX | NASDAQ 100 | https://indexes.nasdaqomx.com/Index/Weighting/NDX<br/>https://en.wikipedia.org/wiki/NASDAQ-100 |
| ^N225 | NIKKEI 225 | http://indexes.nikkei.co.jp/en/nkave/index/component?idx=nk225<br/>https://en.wikipedia.org/wiki/Nikkei_225 |
| ^FTSE | FTSE 100 | http://www.londonstockexchange.com/exchange/prices-and-markets/stocks/indices/summary/summary-indices-constituents.html?index=UKX<br/>https://en.wikipedia.org/wiki/FTSE_100_Index#Current_constituents |

## Roadmap

These indices will be supported in the future:

| Symbol | Index Name | Reference pages |
| ------ | ---------- | -------------- |
| ^STOXX50E | EURO STOXX 50 | https://www.stoxx.com/indices/index_information.html?symbol=SX5E |
| ^GDAXI | DAX | https://en.wikipedia.org/wiki/DAX |
| ^FCHI | CAC 40 | https://en.wikipedia.org/wiki/CAC_40 |
| FTSEMIB.MI | FTSE MIB | https://en.wikipedia.org/wiki/FTSE_MIB |
| ^IBEX | IBEX 35 | https://en.wikipedia.org/wiki/IBEX_35 |
| ^AEX | AEX | https://en.wikipedia.org/wiki/AEX_index |

## Usage

```ruby
components = StockIndex.new('^DJI').components
```
This method returns an array of components. Each component is a Hash with this format:

```ruby
{
  :market => 'XNYS',
  :share => {
    :symbol => 'MMM',
    :name => '3M CO',
    :bbgid => 'BBG000BP52R2'
  },
  :company => {
    :name => '',
    :wikipedia => 'http://en.wikipedia.org/wiki/3M',
    :cik => '0000066740',
  }
}
```

| Key                  | Description |
| ---------------------| ----------- |
| market               | Market symbol according to [ISO 10383](https://github.com/javiervidal/mic) |
| share => symbol      | Component symbol |
| share => name        | Component name according to [Bloomberg Open Symbology](http://bsym.bloomberg.com/sym/) |
| share => bbgid       | BBGID (Bloomberg Security Identifier) according to [Bloomberg Open Symbology](http://bsym.bloomberg.com/sym/)|
| company => name      | Company name according to  |
| company => wikipedia | Link to the wikipedia page of the component, when possible. |
| company => cik       | Component CIK (Central Index Key) assigned to the company by the SEC. Only for US components. |

Share's bbgid is obtained from [Bloomberg Open Symbology predefined files](http://bsym.bloomberg.com/sym/).

Company's name, cik, and sic are obtained querying the [EDGAR database](http://www.sec.gov/edgar/searchedgar/companysearch.html). These data is available only for US indices.

Share's name, and bbgid are cached using [PStore](http://ruby-doc.org/stdlib-1.9.2/libdoc/pstore/rdoc/PStore.html).

## How to Launch the Console

    $ rake console

## How to Run the Test Suite

    $ rspec

## Changelog

[Changelog](https://github.com/javiervidal/stock_index/blob/master/CHANGELOG.md)

## Contributing

1. Fork it ( http://github.com/javiervidal/stock_index/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Code Status

[![Gem Version](http://img.shields.io/badge/gem-v0.8.4-blue.svg)](https://rubygems.org/gems/stock_index)
[![Build Status](https://travis-ci.org/javiervidal/stock_index.svg?branch=master)](https://travis-ci.org/javiervidal/stock_index)
[![Coverage Status](https://coveralls.io/repos/javiervidal/stock_index/badge.png?branch=master)](https://coveralls.io/r/javiervidal/stock_index?branch=master)
[![Code Climate](https://codeclimate.com/github/javiervidal/stock_index/badges/gpa.svg)](https://codeclimate.com/github/javiervidal/stock_index)

## Copyright

Copyright (c) 2014 – ∞ Javier Vidal

## License

This gem is released under the [MIT License](http://opensource.org/licenses/MIT).