require 'helper'

describe SymbolParser do

  describe '#sp500_to_bsym' do

    it "returns 'BRK/B' when 'BRK.B'" do
      expect(SymbolParser.new('BRK.B').sp500_to_bsym).to eq('BRK/B')
    end

  end

  describe '#bsym_to_cik' do

    it "returns '0001067983' when 'BRK/B'" do
      expect(SymbolParser.new('BRK/B').bsym_to_cik).to eq('0001067983')
    end

    it "returns '0000014693' when 'BF/B'" do
      expect(SymbolParser.new('BF/B').bsym_to_cik).to eq('0000014693')
    end

    it "returns '0001355096' when 'QVCA'" do
      expect(SymbolParser.new('QVCA').bsym_to_cik).to eq('0001355096')
    end

    it "returns '0001560385' when 'LMCK'" do
      expect(SymbolParser.new('LMCK').bsym_to_cik).to eq('0001560385')
    end

    it "returns 'CSCO' when 'CSCO'" do
      expect(SymbolParser.new('CSCO').bsym_to_cik).to eq('CSCO')
    end

  end

end