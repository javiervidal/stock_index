require 'helper'

describe SymbolParser do

  describe '#sp500_to_bsym' do

    it "returns 'Z/' when 'Z-'" do
      expect(SymbolParser.new('Z-').symbol_to_bsym).to eq('Z/')
    end

  end

  describe '#bsym_to_cik' do

    it "returns '0001067983' when 'BRK/B'" do
      expect(SymbolParser.new('BRK/B').bsym_to_cik).to eq('0001067983')
    end

    it "returns '0000014693' when 'BF/B'" do
      expect(SymbolParser.new('BF/B').bsym_to_cik).to eq('0000014693')
    end

  end

end