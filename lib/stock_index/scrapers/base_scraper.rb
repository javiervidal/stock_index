class StockIndex

  class BaseScraper

    def td(tr, position)
      tr.css('td')[position]
    end

    def wikipedia(tr, position)
      wikipedia_td = tr.css('td')[position]
      wikipedia_path = wikipedia_td ? wikipedia_td.css('a').first.attributes['href'].value : nil
      URI::HTTP.build({:host => 'en.wikipedia.org', :path => wikipedia_path}).to_s rescue nil
    end

  end

end