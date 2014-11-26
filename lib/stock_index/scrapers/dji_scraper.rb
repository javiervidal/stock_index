class DjiScraper < StockIndex::BaseScraper

  def scrape
    doc = Nokogiri::HTML(open(StockIndex::INDICES['^DJI'][:url]))
    doc.css('table.wikitable.sortable tr').inject([]) do |array, tr|
      symbol = symbol(tr)
      market = market(tr)
      if symbol && market
        bsym = StockIndex::BsymSearch.find(symbol)
        component = StockIndex::Component.new(market, symbol, bsym[:name], wikipedia(tr, 0), nil, bsym[:bbgid])
        array << component.to_hash if component.valid?
      end
      array
    end
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

end