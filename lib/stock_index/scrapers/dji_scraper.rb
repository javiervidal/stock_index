class StockIndex

  class DjiScraper

    def scrape
      doc = Nokogiri::HTML(open(StockIndex::INDICES['^DJI'][:url]))
      doc.css('table.wikitable.sortable tr').inject([]) do |array, tr|
        component = StockIndex::Component.new(market(tr),symbol(tr))
        array << component.to_hash if component.valid?
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

end