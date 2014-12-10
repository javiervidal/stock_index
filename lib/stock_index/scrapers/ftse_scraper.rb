class FtseScraper < StockIndex::BaseScraper

  def scrape
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
        component = StockIndex::Component.new(symbol, market, nil, :ln)
        array << component.attributes if component.valid?
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

end