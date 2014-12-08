class StockIndex
  INDICES = {
    '^DJI' => {
      name: 'DOW JONES INDUSTRIAL AVERAGE',
      url: 'http://en.wikipedia.org/wiki/Dow_Jones_Industrial_Average'
    },
    '^GSPC' => {
      name: 'S&P 500',
      url: 'http://en.wikipedia.org/wiki/List_of_S%26P_500_companies'
    },
    '^NDX' => {
      name: 'NASDAQ 100',
      url: 'http://en.wikipedia.org/wiki/NASDAQ-100'
    },
    '^N225' => {
      name: 'NIKKEI 225',
      url: 'http://indexes.nikkei.co.jp/en/nkave/index/component?idx=nk225',
      wikipedia_url: 'http://en.wikipedia.org/wiki/Nikkei_225'
    },
    '^STOXX50E' => {
      name: 'EURO STOXX 50',
      url: 'http://www.stoxx.com/indices/index_information.html?symbol=SX5E'
    },
    '^FTSE' => {
      name: 'FTSE 100',
      url: 'http://www.londonstockexchange.com/exchange/prices-and-markets/stocks/indices/summary/summary-indices-constituents.html?index=UKX'
    }
  }
end