class SP500Scraper < StockIndex::BaseScraper

  def scrape
    doc = Nokogiri::HTML(open(StockIndex::INDICES['^GSPC'][:url]))
    parse_rows doc.css('table.wikitable.sortable')[0].css('tr')
  end

  private

  def symbol(tr)
    symbol_td = td(tr, 0)
    s = symbol_td ? symbol_td.css('a').first.text : nil
    SymbolParser.new(s).symbol_to_bsym
  end

  def market(tr)
    market_td = td(tr, 0)
    market_link = market_td ? market_td.css('a').first.attributes['href'].value : nil
    StockIndex::Market.new(parse_market_link(market_link)).to_iso10383
  end

  def wikipedia_link(tr)
    wikipedia_position(tr, 1)
  end

  def parse_market_link(market_link)
    if market_link
      uri = URI(market_link)
      uri.host
    else
      nil
    end
  end

end