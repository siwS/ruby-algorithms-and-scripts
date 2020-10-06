#!/usr/bin/env ruby

strike_price_1 = 5.00
strike_price_2 = 20.00
fair_market_value = 25

amount_to_spend = ARGV[0].to_i
ipo_value = ARGV[1].to_i

# how many stocks can you buy with this amount

x_1 = amount_to_spend / (strike_price_1 + (fair_market_value - strike_price_1)*0.52 )
x_2 = amount_to_spend / (strike_price_2 + (fair_market_value - strike_price_2)*0.52 )

puts "You can buy #{x_1} stocks of #{strike_price_1} or #{x_2} stocks of #{strike_price_2}"

puts "Now let's say there's ipo at #{ipo_value}"

# extra tax to pay when IPO 

tax_1 = (ipo_value-fair_market_value)* x_1* 0.33
tax_2 = (ipo_value-fair_market_value)* x_2* 0.33

puts "When selling you have to pay extra tax for batch 1 at #{tax_1}"
puts "When selling you have to pay extra tax for batch 2 at #{tax_2}"

puts "With stocks from batch 1 you will have earned #{ipo_value*x_1 - tax_1 - amount_to_spend}"
puts "With stocks from batch 2 you will have earned #{ipo_value*x_2 - tax_2 - amount_to_spend}"
