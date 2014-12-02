class StockIndex

  class Component

    require 'cik'

    def initialize(symbol, market, wikipedia)
      @symbol = symbol
      @market = market
      @wikipedia = wikipedia
    end

    def attributes
      cache_lookup || attributes_lookup
    end

    def valid?
      @market && @symbol
    end

    def cache_lookup
      store = PStore.new('cache/data.pstore')
      store.transaction { store[@symbol] }
    end

    def cache_write(a)
      store = PStore.new('cache/data.pstore')
      store.transaction do
        store[@symbol] = a
      end
      a
    end

    def attributes_lookup
      puts "--> #{@symbol}"
      bsym = StockIndex::BsymSearch.find(@symbol)
      edgar = Cik.lookup(parse_symbol(@symbol))
      a = {market: @market, symbol: @symbol, name: bsym[:name], wikipedia: @wikipedia, cik: edgar[:cik], bbgid: bsym[:bbgid]}
      cache_write(a)
    end

    def parse_symbol(symbol)
      case symbol
        # BRK/B => 0001067983 Berkshire Hathaway Inc
        # BF/B => 0000014693 Brown-Forman Corp
        when 'BRK/B'
          '0001067983'
        when 'BF/B'
          '0000014693'
        else
          symbol
      end
    end

  end

end