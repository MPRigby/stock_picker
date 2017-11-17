#lib/stock_picker.rb
def pick_stock(prices = [])
  lowest_price = nil
  lowest_price_day = 0
  highest_price = nil
  highest_price_day = 0
  buy_sell_days = [0,0]

  prices.each_with_index do |price, day|
    if lowest_price == nil || price < lowest_price
      lowest_price = price
      lowest_price_day = day
    end
    if lowest_price < price && (highest_price == nil || price > highest_price)  #only store as the highest price when a lower price has already been found, i.e. a sale for profit is possible at this price
      highest_price = price
      highest_price_day = day
    end
    if lowest_price!=nil && highest_price != nil && lowest_price_day < highest_price_day
      buy_sell_days = [lowest_price_day, highest_price_day]
    end
  end

  buy_sell_days
end
