class StockIndex

  class BaseScraper

    require 'nokogiri'

    def parse_rows(rows)
      rows.inject([]) do |array, tr|
        symbol = symbol(tr)
        market = market(tr)
        if symbol && market
          component = StockIndex::Component.new(symbol, market, wikipedia(tr))
          array << component.attributes if component.valid?
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
      URI::HTTP.build({:host => 'en.wikipedia.org', :path => wikipedia_path}).to_s rescue nil
    end

    def parse_symbol(symbol)
      case symbol
        # BRK.B => BRK/B
        # BF.B => BF/B
        when /(\w+)\.B/
          "#{$1}/B"
        else
          symbol
      end
    end

  end

end