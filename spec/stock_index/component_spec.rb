require 'helper'

describe StockIndex::Component do

  it 'returns the value written to the cache' do
    component = StockIndex::Component.new('T', 'test', nil)
    component.cache_write('ZZZZ')
    expect(component.cache_lookup).to eq('ZZZZ')
  end

  it 'returns the correct attributes with a valid symbol' do
    component = StockIndex::Component.new('CSCO', 'XNAS', nil)
    expect(component.attributes_lookup).to eq({:market=>"XNAS", :share=>{:symbol=>"CSCO", :name=>"CISCO SYSTEMS INC", :bbgid=>"BBG000C3J3C9"}, :company=>{:wikipedia=>nil, :cik=>"0000858877", :name=>"CISCO SYSTEMS, INC.", :sic=>"3576"}})
  end

  it 'returns nil with an invalid symbol' do
    component = StockIndex::Component.new('ZZZZ', 'XNAS', nil)
    expect(component.attributes_lookup).to be_nil
  end

end