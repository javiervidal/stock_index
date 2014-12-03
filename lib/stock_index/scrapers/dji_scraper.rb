class DjiScraper < StockIndex::BaseScraper

  def scrape
    doc = Nokogiri::HTML(open(StockIndex::INDICES['^DJI'][:url]))
    parse_rows doc.css('table.wikitable.sortable tr')
  end

  private

  def symbol(tr)
    symbol_td = td(tr, 2)
    symbol_td ? symbol_td.css('a').first.text : nil
  end

  def market(tr)
    market_td = td(tr, 1)
    market = market_td ? market_td.css('a').first.text : nil
    StockIndex::Market.new(market).to_iso10383
  end

  def wikipedia_link(tr)
    wikipedia_position(tr, 0)
  end

end