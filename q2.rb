require 'httparty'
require 'json'

def cryptopricetracker
  response = HTTParty.get("https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd")
  cryptocurrencies = JSON.parse(response.body)

  top_five = cryptocurrencies.sort_by { |crypto| crypto['market_cap'] }.reverse.first(5)

  puts "Top 5 Cryptocurrencies Sorted by Market Cap:\n"
  top_five.each do |crypto|
    puts "Name: #{crypto['name']}"
    puts "Price: #{crypto['current_price']} USD"
    puts "Market Cap: #{crypto['market_cap']} USD\n\n"
  end
end

cryptopricetracker
