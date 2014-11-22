class StockIndex
  ATTRIBUTES = {
    '^DJI' => {
      name: 'DOW JONES INDUSTRIAL AVERAGE',
      page: 'http://en.wikipedia.org/wiki/Dow_Jones_Industrial_Average'
    },
    '^GSPC' => {
      name: 'S&P 500',
      page: 'http://en.wikipedia.org/wiki/List_of_S%26P_500_companies'
    },
    '^NDX' => {
      name: 'NASDAQ 100',
      page: 'https://indexes.nasdaqomx.com/Index/Weighting/NDX'
    },
    '^N225' => {
      name: 'NIKKEI 225',
      page: 'http://indexes.nikkei.co.jp/en/nkave/index/component?idx=nk225'
    },
    '^STOXX50E' => {
      name: 'EURO STOXX 50',
      page: 'http://www.stoxx.com/indices/index_information.html?symbol=SX5E'
    },
    '^FTSE' => {
      name: 'FTSE 100',
      page: 'http://www.londonstockexchange.com/exchange/prices-and-markets/stocks/indices/summary/summary-indices-constituents.html?index=UKX'
    }
  }
end