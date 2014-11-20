# StockIndicesComponents

This gem provides the components of major stock indices in the world. The components are scraped from reference
pages, such as Wikipedia.

## Installation

Add this line to your application's Gemfile:

    gem 'stock_indices_components'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install stock_indices_components

## Supported indices

There is no a standard for indices symbols, so this gem uses Yahoo Finance symbols.

| Symbol | Index Name |
| ------ | ---------- |
| ^DJI | Dow Jones Industrial Average |
| ^GSPC | S&P 500 |
| ^NDX | NASDAQ 100 |
| ^N225 | Nikkei 225 |
| ^STOXX50E | EURO STOXX 50 |
| ^FTSE | FTSE 100 |

## Usage

```ruby
components = StockIndicesComponents.new('^DJI').get
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