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
      bsym = StockIndex::BsymSearch.find(@symbol)
      if bsym.nil?
        puts "bsym --> #{@symbol}"
        return
      else
        edgar = Cik.lookup(SymbolParser.new(@symbol).bsym_to_cik)
        if edgar.nil?
          puts "cik --> #{@symbol}"
        else
          a = {market: @market, symbol: @symbol, name: bsym[:name], wikipedia: @wikipedia, cik: edgar[:cik], bbgid: bsym[:bbgid]}
          cache_write(a)
        end
      end
    end

  end

end