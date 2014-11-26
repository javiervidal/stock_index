class StockIndex

  class Component

    def initialize(market, symbol, name = nil, wikipedia = nil, cik = nil, bbgid = nil)
      @market = market
      @symbol = symbol
      @name = name
      @wikipedia = wikipedia
      @cik = cik
      @bbgid = bbgid
    end

    def to_hash
      {
        market: @market,
        symbol: @symbol,
        name: @name,
        wikipedia: @wikipedia,
        cik: @cik,
        bbgid: @bbgid,
      }
    end

    def valid?
      @market && @symbol
    end

  end

end