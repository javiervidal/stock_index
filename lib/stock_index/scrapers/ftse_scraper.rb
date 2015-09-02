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
    s.nil? ? nil : s.sub('.', '/')
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
    end.merge(ftse_not_found_wikipedia_links)
  end

  def ftse_not_found_wikipedia_links
    {
      'III' => 'https://en.wikipedia.org/wiki/3i',
      'AHT' => 'https://en.wikipedia.org/wiki/Ashtead_Group',
      'AV/' => 'https://en.wikipedia.org/wiki/Aviva',
      'BA/' => 'https://en.wikipedia.org/wiki/BAE_Systems',
      'BDEV' => 'https://en.wikipedia.org/wiki/Barratt_Developments',
      'BG/' => 'https://en.wikipedia.org/wiki/BG_Group',
      'BP/' => 'https://en.wikipedia.org/wiki/BP',
      'BATS' => 'https://en.wikipedia.org/wiki/British_American_Tobacco',
      'BT/A' => 'https://en.wikipedia.org/wiki/BT_Group',
      'CCL' => 'https://en.wikipedia.org/wiki/Carnival_Corporation_%26_plc',
      'DLG' => 'https://en.wikipedia.org/wiki/Direct_Line_Group',
      'DC/' => 'https://en.wikipedia.org/wiki/Dixons_Carphone',
      'EZJ' => 'https://en.wikipedia.org/wiki/EasyJet',
      'HL/' => 'https://en.wikipedia.org/wiki/Hargreaves_Lansdown',
      'HIK' => 'https://en.wikipedia.org/wiki/Hikma_Pharmaceuticals',
      'ISAT' => 'https://en.wikipedia.org/wiki/Inmarsat',
      'INTU' => 'https://en.wikipedia.org/wiki/Intu_Properties',
      'LSE' => 'https://en.wikipedia.org/wiki/London_Stock_Exchange_Group',
      'MERL' => 'https://en.wikipedia.org/wiki/Merlin_Entertainments',
      'MNDI' => 'https://en.wikipedia.org/wiki/Mondi',
      'NG/' => 'https://en.wikipedia.org/wiki/National_Grid_plc',
      'PSON' => 'https://en.wikipedia.org/wiki/Pearson_PLC',
      'PSN' => 'https://en.wikipedia.org/wiki/Persimmon_plc',
      'RDSB' => 'https://en.wikipedia.org/wiki/Royal_Dutch_Shell',
      'RB/' => 'https://en.wikipedia.org/wiki/Reckitt_Benckiser',
      'RR/' => 'https://en.wikipedia.org/wiki/Rolls-Royce_Holdings',
      'RMG' => 'https://en.wikipedia.org/wiki/Royal_Mail',
      'SHP' => 'https://en.wikipedia.org/wiki/Shire_(pharmaceutical_company)',
      'SKY' => 'https://en.wikipedia.org/wiki/Sky_plc',
      'SN/' => 'https://en.wikipedia.org/wiki/Smith_%26_Nephew',
      'SPD' => 'https://en.wikipedia.org/wiki/Sports_Direct',
      'STJ' => 'https://en.wikipedia.org/wiki/St._James%27s_Place_plc',
      'SL/' => 'https://en.wikipedia.org/wiki/Standard_Life',
      'TW/' => 'https://en.wikipedia.org/wiki/Taylor_Wimpey',
      'TPK' => 'https://en.wikipedia.org/wiki/Travis_Perkins',
      'TUI' => 'https://en.wikipedia.org/wiki/TUI_Group',
      'UU/' => 'https://en.wikipedia.org/wiki/United_Utilities'
    }
  end

end