class NikkeiScraper < StockIndex::BaseScraper

  def scrape
    doc = Nokogiri::HTML(open(StockIndex::INDICES['^N225'][:url]))
    parse_rows doc.css('table.cmn-table tr.cmn-charcter')
  end

  private

  def parse_rows(rows)
    rows.inject([]) do |array, tr|
      symbol = tr.css('td')[0].text
      market = 'XJPX'
      if symbol && market
        component = StockIndex::Component.new(symbol, market, nil, :jp)
        array << component.attributes if component.valid?
      end
      array
    end
  end

end