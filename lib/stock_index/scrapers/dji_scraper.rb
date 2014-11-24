class DjiScraper

  def scrape
    doc = Nokogiri::HTML(open(StockIndex::ATTRIBUTES['^DJI'][:url]))
    doc.css('table.wikitable.sortable tr').inject([]) do |array, tr|
      string = "#{market(tr)}:#{symbol(tr)}"
      array << string unless string == ":"
      array
    end
  end

  private

  def symbol(tr)
    symbol_td = tr.css('td')[2]
    symbol_td ? symbol_td.css('a').first.text : nil
  end

  def market(tr)
    market_td = tr.css('td')[1]
    market = market_td ? market_td.css('a').first.text : nil
    StockIndex::Market.new(market).to_iso10383
  end

end