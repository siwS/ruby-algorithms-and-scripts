sum = 3
(1..115).each do |n|
  cur = 4**(n-1)*3*(1.0/(3**n))
  puts cur
  sum += cur
end

puts sum

