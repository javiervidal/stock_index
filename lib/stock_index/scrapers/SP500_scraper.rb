class SP500Scraper < StockIndex::BaseScraper

  def scrape
    doc = Nokogiri::HTML(open(StockIndex::INDICES['^GSPC'][:url]))
    doc.css('table.wikitable.sortable')[0].css('tr').inject([]) do |array, tr|
      symbol = symbol(tr)
      market = market(tr)
      if symbol && market
        bsym = StockIndex::BsymSearch.find(symbol)
        component = StockIndex::Component.new(market, symbol, bsym[:name], wikipedia(tr, 1), nil, bsym[:bbgid])
        array << component.to_hash if component.valid?
      end
      array
    end
  end

  private

  def symbol(tr)
    symbol_td = td(tr, 0)
    s = symbol_td ? symbol_td.css('a').first.text : nil
    parse_symbol(s)
  end

  def market(tr)
    market_td = td(tr, 0)
    market_link = market_td ? market_td.css('a').first.attributes['href'].value : nil
    StockIndex::Market.new(parse_market_link(market_link)).to_iso10383
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