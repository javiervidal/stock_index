class StockIndex

  class BsymSearch

    require 'csv'

    class << self

      def find(symbol, pricing_source)
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