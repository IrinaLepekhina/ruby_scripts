class Trading
  attr_accessor :balance

  # Solution 1: One Pass
  def get_max_profit(stock_prices = [])

    return 0 if stock_prices.length < 2
      
    p_buy = stock_prices[0]
    p_sell = stock_prices[1]
    max_profit = p_sell-p_buy
    
    stock_prices.each do |price|
      if price - p_buy > max_profit
        max_profit = price - p_buy
        p_sell = price
      elsif price < p_buy
        p_buy = price
        p_sell = price
      end
    end

    max_profit
  end

  # Solution 2: greedily
  # def get_max_profit(stock_prices = [])

  #   return 0 if stock_prices.length < 2

  #   min_price = stock_prices[0]
  #   max_profit = stock_prices[1] - stock_prices[0]
  
  #   stock_prices.each_with_index do |current_price, index|
  #     next if index.zero?
  
  #     potential_profit = current_price - min_price
  #     max_profit = [max_profit, potential_profit].max
  #     min_price  = [min_price, current_price].min
  #   end
  
  #   max_profit
  # end
    
  # # Solution 3: Brute Force
  # def get_max_profit(stock_prices = [])

  #   return 0 if stock_prices.length < 2

  #   max_profit = 0

  #   (0...stock_prices.length).each do |i|
  #     ((i+1)...stock_prices.length).each do |j|
  #       if stock_prices[j] - stock_prices[i] > max_profit
  #         max_profit = stock_prices[j] - stock_prices[i]
  #       end
  #     end
  #   end
  #   @balance = max_profit
  # end

  # # Solution 4: Dynamic Programming, Kadane's algorithm
  # def get_max_profit(stock_prices = [])

  #   return 0 if stock_prices.length < 2

  #   max_profit = 0
  #   max_ending_here = 0
    
  #   (1...stock_prices.length).each do |i|
  #     diff = stock_prices[i] - stock_prices[i-1]
  #     max_ending_here = [max_ending_here + diff, 0].max
  #     max_profit = [max_profit, max_ending_here].max
  #   end

  #   @balance = max_profit
  # end

end

