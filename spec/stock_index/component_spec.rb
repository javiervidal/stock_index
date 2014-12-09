require 'helper'

describe StockIndex::Component do

  it 'returns the value written to the cache' do
    component = StockIndex::Component.new('T', 'test', nil)
    component.cache_write('ZZZZ')
    expect(component.cache_lookup).to eq('ZZZZ')
  end

end