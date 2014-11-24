class StockIndex

  class Market

    def initialize(market)
      @market = market
    end

    def to_iso10383
      case @market
        when 'NYSE', 'www.nyse.com'
          'XNYS'
        when 'NASDAQ', 'www.nasdaq.com'
          'XNAS'
      end
    end

  end

end