class StockIndex

  require 'nokogiri'

  def initialize(symbol)
    @symbol = symbol
  end

  def components
    case @symbol
      when '^DJI'
        DjiScraper.new.scrape
      when '^GSPC'
        SP500Scraper.new.scrape
      else
        []
    end
  end

end