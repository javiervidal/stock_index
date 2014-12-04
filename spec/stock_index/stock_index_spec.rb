require 'helper'

describe StockIndex do

  it 'returns a blank array for a not known index' do
    expect(StockIndex.new('ZZZZ').components).to eq([])
  end

  # How to generate a fixture file
  #
  # require 'yaml'
  # File.open('spec/fixtures/DJI.yaml', 'w') {|f| f.write StockIndex.new('^DJI').components.map{ |e| e[:symbol]}.to_yaml }
  # File.open('spec/fixtures/GSPC.yaml', 'w') {|f| f.write StockIndex.new('^GSPC').components.map{ |e| e[:symbol]}.to_yaml }
  # File.open('spec/fixtures/NDX.yaml', 'w') {|f| f.write StockIndex.new('^NDX').components.map{ |e| e[:symbol]}.to_yaml }

  it 'returns components for ^DJI' do
    expect(StockIndex.new('^DJI').components.map{ |e| e[:symbol] }).to match_array(components_from_fixture('^DJI'))
  end

  it 'returns components for ^GSPC' do
    expect(StockIndex.new('^GSPC').components.map{ |e| e[:symbol] }).to match_array(components_from_fixture('^GSPC'))
  end

  it 'returns components for ^NDX' do
    expect(StockIndex.new('^NDX').components.map{ |e| e[:symbol] }).to match_array(components_from_fixture('^NDX'))
  end

end