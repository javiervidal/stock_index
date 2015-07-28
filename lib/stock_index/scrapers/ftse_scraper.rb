class FtseScraper < StockIndex::BaseScraper

  def scrape
    @wikipedia_hash = parse_wikipedia_page(Nokogiri::HTML(open(StockIndex::INDICES['^FTSE'][:wikipedia_url])))
    (1..6).inject([]) do |array, page|
      doc = Nokogiri::HTML(open(url(page)))
      array += parse_rows(doc.css('table.table_dati tr'))
      array
    end
  end

  private

  def parse_rows(rows)
    rows.inject([]) do |array, tr|
      symbol = symbol(tr)
      market = 'XLON'
      if symbol && market
        component = StockIndex::Component.new(symbol, market, @wikipedia_hash[symbol], :ln)
        array << component.attributes
      end
      array
    end
  end

  def symbol(tr)
    symbol_td = td(tr, 0)
    s = symbol_td ? symbol_td.text : nil
    SymbolParser.new(s).symbol_to_bsym
  end

  def url(page)
    "#{StockIndex::INDICES['^FTSE'][:url]}&page=#{page}"
  end

  def parse_wikipedia_page(wikipedia_doc)
    wikipedia_doc.css('#constituents tr').inject({}) do |hash, tr|
      link_td = tr.css('td')[0]
      symbol_td = tr.css('td')
      if link_td
        hash[symbol_td[1].text] = build_wikipedia_link(link_td.css('a').first.attributes['href'].value)
      end
      hash
    end
  end

end