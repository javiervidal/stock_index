class StockIndex

  class BsymSearch

    require 'csv'

    FILES = {
      us: 'csv/US.csv'
    }

    class << self

      def find(symbol, pricing_source = :us)
        CSV.foreach(FILES[pricing_source]) do |row|
          return {name: row[1], bbgid: row[2]} if row[0] == symbol
        end
      end

    end

  end

end