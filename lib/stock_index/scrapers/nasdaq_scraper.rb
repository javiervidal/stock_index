class NasdaqScraper < StockIndex::BaseScraper

  def scrape
    doc = Nokogiri::HTML(open(StockIndex::INDICES['^NDX'][:url]))
    parse_rows doc.css('ol')[0].css('li')
  end

  def parse_rows(rows)
    rows.inject([]) do |array, li|
      symbol = /.+\((\w+)\)/.match(li)[1]
      market = 'XNAS'
      if symbol && market
        component = StockIndex::Component.new(symbol, market, wikipedia(li))
        array << component.attributes if component.valid?
      end
      array
    end
  end

  def wikipedia(li)
    wikipedia_path = li.css('a')[0].attributes['href'].value
    build_wikipedia_link(wikipedia_path)
  end

end