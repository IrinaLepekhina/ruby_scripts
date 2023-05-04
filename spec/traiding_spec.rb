require 'byebug'

RSpec.describe Trading do
  describe '#get_max_profit' do
    it 'returns max amount from buy-sell activity' do
      stock_prices = [10, 7, 5, 8, 11, 9]
      expect(Trading.new.get_max_profit(stock_prices)).to eq(6)
    end

    it 'returns 0 when the array has fewer than 2 elements' do
      stock_prices = [1]
      expect(Trading.new.get_max_profit(stock_prices)).to eq(0)
    end

    it 'returns 0 when all elements in the array are the same' do
      stock_prices = [5, 5, 5, 5, 5]
      expect(Trading.new.get_max_profit(stock_prices)).to eq(0)
    end
  end
end