class StockIndex

  class Market

    def initialize(market)
      @market = market
    end

    def to_iso10383
      case @market
        when 'NYSE'
          'XNYS'
        when 'NASDAQ'
          'XNAS'
      end
    end

  end

end