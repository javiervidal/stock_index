require 'helper'

describe StockIndex do

  it 'returns a blank array for a not known index' do
    expect(StockIndex.new('ZZZZ').components).to eq([])
  end

  # How to generate a fixture file
  #
  # require 'yaml'
  # File.open('spec/fixtures/yaml/DJI.yaml', 'w') {|f| f.write StockIndex.new('^DJI').components.map{ |e| e[:symbol]}.to_yaml }
  # File.open('spec/fixtures/yaml/GSPC.yaml', 'w') {|f| f.write StockIndex.new('^GSPC').components.map{ |e| e[:symbol]}.to_yaml }
  # File.open('spec/fixtures/yaml/NDX.yaml', 'w') {|f| f.write StockIndex.new('^NDX').components.map{ |e| e[:symbol]}.to_yaml }
  # File.open('spec/fixtures/yaml/N225.yaml', 'w') {|f| f.write StockIndex.new('^N225').components.map{ |e| e[:symbol]}.to_yaml }
  # File.open('spec/fixtures/yaml/FTSE.yaml', 'w') {|f| f.write StockIndex.new('^FTSE').components.map{ |e| e[:symbol]}.to_yaml }

  it 'returns components for ^DJI' do
    expect(StockIndex.new('^DJI').components.map{ |e| e[:symbol] }).to match_array(components_from_fixture('^DJI'))
  end

  it 'returns components for ^GSPC' do
    expect(StockIndex.new('^GSPC').components.map{ |e| e[:symbol] }).to match_array(components_from_fixture('^GSPC'))
  end

  it 'returns components for ^NDX' do
    expect(StockIndex.new('^NDX').components.map{ |e| e[:symbol] }).to match_array(components_from_fixture('^NDX'))
  end

  it 'returns components for ^N225' do
    expect(StockIndex.new('^N225').components.map{ |e| e[:symbol] }).to match_array(components_from_fixture('^N225'))
  end

  it 'returns components for ^FTSE' do
    expect(StockIndex.new('^FTSE').components.map{ |e| e[:symbol] }).to match_array(components_from_fixture('^FTSE'))
  end

end