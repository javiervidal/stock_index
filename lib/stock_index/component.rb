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
      bsym = StockIndex::BsymSearch.find(@symbol, @pricing_source)
      cik = lookup_cik
      puts "   --- #{@symbol} bsym: #{bsym}"
      puts "   --- #{@symbol} cik: #{cik}"
      return nil unless bsym
      a = {
        market: @market,
        share: {
          symbol: @symbol,
          name: bsym[:name],
          bbgid: bsym[:bbgid]
        },
        company: {wikipedia: @wikipedia}.merge( cik || {} )
      }
      cache_write(a)
      a
    end

    def us?
      @pricing_source == :us
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
        {
          cik: edgar[:cik],
          name: edgar[:name],
          sic: edgar[:sic]
        }
      else
        return nil
      end
    end

    def valid?(attributes)
      !attributes[:market].nil? &&
      !attributes[:share][:symbol].nil? &&
      !attributes[:share][:name].nil? &&
      !attributes[:share][:bbgid].nil? &&
      !attributes[:company][:wikipedia].nil?
    end

  end

end