require 'helper'

describe StockIndex do

  it 'returns a blank array for a not known index' do
    expect(StockIndex.new('ZZZZ').components).to eq([])
  end

  # How to generate a fixture file
  #
  # require 'yaml'
  # File.open('spec/fixtures/NDX.yaml', 'w') {|f| f.write StockIndex.new('^NDX').components.to_yaml }

  it 'returns components for ^DJI' do
    expect(StockIndex.new('^DJI').components.map{ |e| e[:symbol] }).to match_array(components_from_fixture('^DJI').map{ |e| e[:symbol] })
  end

  it 'returns components for ^GSPC' do
    expect(StockIndex.new('^GSPC').components.map{ |e| e[:symbol] }).to match_array(components_from_fixture('^GSPC').map{ |e| e[:symbol] })
  end

  it 'returns components for ^NDX' do
    expect(StockIndex.new('^NDX').components.map{ |e| e[:symbol] }).to match_array(components_from_fixture('^NDX').map{ |e| e[:symbol] })
  end

end