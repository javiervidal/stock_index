class NikkeiScraper < StockIndex::BaseScraper

  def scrape
    doc = Nokogiri::HTML(open(StockIndex::INDICES['^N225'][:url]))
    @wikipedia_hash = parse_wikipedia_page(Nokogiri::HTML(open(StockIndex::INDICES['^N225'][:wikipedia_url])))
    parse_rows doc.css('table.cmn-table tr.cmn-charcter')
  end

  private

  def parse_rows(rows)
    rows.inject([]) do |array, tr|
      symbol = tr.css('td')[0].text
      market = 'XJPX'
      if symbol && market
        component = StockIndex::Component.new(symbol, market, @wikipedia_hash[symbol], :jp)
        array << component.attributes
      end
      array
    end
  end

  def parse_wikipedia_page(wikipedia_doc)
    wikipedia_doc.css('#constituents tr').inject({}) do |hash, tr|
      md = tr.text.match(/\n(\d{4})\n/)
      if md
        symbol = md[1]
        link = build_wikipedia_link(tr.css('a').first.attributes['href'].value)
        hash[symbol] = link
      end
      hash
    end
  end

end