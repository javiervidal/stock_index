class StockIndex

  class BsymSearch

    require 'csv'

    EXCEPTIONS = {
      'BIDU' => {name: 'BAIDU INC', bbgid: 'BBG000QXWHD1'},
      'LVNTA' => {name: 'LIBERTY VENTURES', bbgid: 'BBG0038K9G41'},
      'VIP' => {name: 'VIMPELCOM LTD', bbgid: 'BBG000QCW561'},
      'VOD' => {name: 'VODAFONE GROUP PLC', bbgid: 'BBG000C4R6H6'}
    }

    class << self

      def find(symbol, pricing_source)
        return {name: EXCEPTIONS[symbol][:name], bbgid: EXCEPTIONS[symbol][:bbgid]} if EXCEPTIONS.keys.include? symbol
        CSV.foreach(files(pricing_source)) do |row|
          return {name: row[1], bbgid: row[2]} if row[0] == symbol
        end
      end

      def files(pricing_source)
        File.expand_path("../../bsym/#{pricing_source.upcase}.csv", File.dirname(__FILE__))
      end

    end

  end

end