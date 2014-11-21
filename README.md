# StockIndices

This gem provides the components of major stock indices in the world. The components are scraped from reference
pages, such as Wikipedia.

## Installation

Add this line to your application's Gemfile:

    gem 'stock_indices'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install stock_indices

## Supported indices

There is no a standard for indices symbols, so this gem uses Yahoo Finance symbols.

| Symbol | Index Name | Reference page |
| ------ | ---------- | -------------- |
| ^DJI | Dow Jones Industrial Average | http://en.wikipedia.org/wiki/Dow_Jones_Industrial_Average |
| ^GSPC | S&P 500 | http://en.wikipedia.org/wiki/List_of_S%26P_500_companies |
| ^NDX | NASDAQ 100 | https://indexes.nasdaqomx.com/Index/Weighting/NDX |
| ^N225 | Nikkei 225 | http://indexes.nikkei.co.jp/en/nkave/index/component?idx=nk225 |
| ^STOXX50E | EURO STOXX 50 | http://www.stoxx.com/indices/index_information.html?symbol=SX5E |
| ^FTSE | FTSE 100 | http://www.londonstockexchange.com/exchange/prices-and-markets/stocks/indices/summary/summary-indices-constituents.html?index=UKX |

## Usage

```ruby
components = StockIndices.new('^DJI').components
```
This method returns an array of components. Each component is a Hash with this format:

```ruby
{
  :market => 'XNYS',
  :symbol => 'MMM',
  :name => '3M CO'
}
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/stock_indices_components/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Copyright

Copyright (c) 2014 – ∞ Javier Vidal

## License

This gem is released under the [MIT License](http://opensource.org/licenses/MIT).