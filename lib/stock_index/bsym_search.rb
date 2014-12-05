class StockIndex

  class BsymSearch

    require 'csv'

    FILES = {
      us: 'bsym/US.csv',
      jp: 'bsym/JP.csv',
    }

    EXCEPTIONS = {
      'BIDU' => {name: 'BAIDU INC', bbgid: 'BBG000QXWHD1'},
      'LVNTA' => {name: 'LIBERTY VENTURES', bbgid: 'BBG0038K9G41'},
      'VIP' => {name: 'VIMPELCOM LTD', bbgid: 'BBG000QCW561'},
      'VOD' => {name: 'VODAFONE GROUP PLC', bbgid: 'BBG000C4R6H6'}
    }

    class << self

      def find(symbol, pricing_source)
        return {name: EXCEPTIONS[symbol][:name], bbgid: EXCEPTIONS[symbol][:bbgid]} if EXCEPTIONS.keys.include? symbol
        CSV.foreach(FILES[pricing_source]) do |row|
          return {name: row[1], bbgid: row[2]} if row[0] == symbol
        end
      end

    end

  end

end