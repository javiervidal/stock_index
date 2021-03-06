class StockIndex

  def initialize(symbol)
    @symbol = symbol
  end

  def components
    case @symbol
      when '^DJI'
        DjiScraper.new.scrape
      when '^GSPC'
        SP500Scraper.new.scrape
      when '^NDX'
        NasdaqScraper.new.scrape
      when '^N225'
        NikkeiScraper.new.scrape
      when '^FTSE'
        FtseScraper.new.scrape
      else
        []
    end
  end

end