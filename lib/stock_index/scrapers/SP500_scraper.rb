class StockIndex

  class SP500Scraper

    def scrape
      doc = Nokogiri::HTML(open(StockIndex::INDICES['^GSPC'][:url]))
      doc.css('table.wikitable.sortable')[0].css('tr').inject([]) do |array, tr|
        component = StockIndex::Component.new(market(tr),symbol(tr))
        array << component.to_hash if component.valid?
        array
      end
    end

    private

    def symbol(tr)
      symbol_td = td(tr, 0)
      symbol_td ? symbol_td.css('a').first.text : nil
    end

    def market(tr)
      market_td = td(tr, 0)
      market_link = market_td ? market_td.css('a').first.attributes['href'].value : nil
      StockIndex::Market.new(parse_market_link(market_link)).to_iso10383
    end

    def td(tr, position)
      tr.css('td')[position]
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

end