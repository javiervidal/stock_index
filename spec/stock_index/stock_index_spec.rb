require 'helper'

describe 'stock_index' do

  it 'returns a blank array for a not known index' do
    expect(StockIndex.new('ZZZZ').components).to eq([])
  end

  it 'returns components for ^DJI' do
    expect(StockIndex.new('^DJI').components).to eq(components_from_fixture('^DJI'))
  end

  it 'returns components for ^GSPC' do
    expect(StockIndex.new('^GSPC').components).to eq(components_from_fixture('^GSPC'))
  end

end