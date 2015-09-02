class StockIndex

  class BaseScraper

    require 'nokogiri'

    def parse_rows(rows)
      rows.inject([]) do |array, tr|
        symbol = symbol(tr)
        market = market(tr)
        if symbol && market
          component = StockIndex::Component.new(symbol, market, wikipedia_link(tr))
          array << component.attributes
        end
        array
      end
    end

    def td(tr, position)
      tr.css('td')[position]
    end

    def wikipedia_position(tr, position)
      wikipedia_td = tr.css('td')[position]
      wikipedia_path = wikipedia_td ? wikipedia_td.css('a').first.attributes['href'].value : nil
      build_wikipedia_link(wikipedia_path)
    end

    def build_wikipedia_link(wikipedia_path)
      URI::Generic.new('https', nil, 'en.wikipedia.org', nil, nil, wikipedia_path, nil, nil, nil).to_s rescue nil
    end

  end

end