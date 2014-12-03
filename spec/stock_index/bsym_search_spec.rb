require 'helper'

describe StockIndex::BsymSearch do

  context 'searching a symbol in EXCEPTIONS' do

    it 'returns the component' do
      expect(StockIndex::BsymSearch.find('BIDU')).to eq({name: 'BAIDU INC', bbgid: 'BBG000QXWHD1'})
    end

  end

  context 'searching a symbol in the CSV file' do

    it 'returns the component' do
      expect(StockIndex::BsymSearch.find('CSCO')).to eq({:name=>"CISCO SYSTEMS INC", :bbgid=>"BBG000C3J3C9"})
    end

  end

  context 'searching a non existent symbol' do

    it 'returns nil' do
      expect(StockIndex::BsymSearch.find('ZZZZ')).to eq(nil)
    end

  end

end