class StockIndex

  class Component

    require 'cik'

    def initialize(symbol, market, wikipedia, pricing_source = :us)
      @symbol = symbol
      @market = market
      @wikipedia = wikipedia
      @pricing_source = pricing_source
    end

    def attributes
      attrs = cache_lookup || attributes_lookup
      puts "---- ERROR #{attrs}" unless valid?(attrs)
      attrs
    end

    def cache_lookup
      store = PStore.new(cache_file)
      store.transaction { store[@symbol] }
    end

    def cache_write(a)
      store = PStore.new(cache_file)
      store.transaction do
        store[@symbol] = a
      end
    end

    def cache_file
      File.expand_path("../../cache/#{@market}.pstore", File.dirname(__FILE__))
    end

    def attributes_lookup
      bsym = lookup_bsym
      cik = lookup_cik
      return nil unless bsym
      a = {market: @market, symbol: @symbol, name: bsym[:name], wikipedia: @wikipedia, cik: cik, bbgid: bsym[:bbgid]}
      cache_write(a)
      a
    end

    def us?
      @pricing_source == :us
    end

    def lookup_bsym
      bsym = StockIndex::BsymSearch.find(@symbol, @pricing_source)
      if bsym
        bsym
      else
        return nil
      end
    end

    def lookup_cik
      if us?
        lookup_cik_us
      else
        nil
      end
    end

    def lookup_cik_us
      edgar = Cik.lookup(SymbolParser.new(@symbol).bsym_to_cik)
      if edgar
        edgar[:cik]
      else
        return nil
      end
    end

    def valid?(attributes)
      !attributes[:market].nil? && !attributes[:symbol].nil? && !attributes[:name].nil? && !attributes[:wikipedia].nil? && !attributes[:cik].nil? && !attributes[:bbgid].nil?
    end

  end

end