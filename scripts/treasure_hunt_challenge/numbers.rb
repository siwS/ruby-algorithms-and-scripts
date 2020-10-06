i     = 1
count = 0
sum   = 0

while count < 20
  digits = i.digits.uniq

  # make sure there is at least 1 or 0
  if !digits.include?(1) && !digits.include?(0)
    i += 1
    next
  end

  digits = digits - [0]
  digits = digits - [1]

  # make sure there is only 1 or 0
  if i % 13 == 0 && digits.empty?
    sum   += i
    count += 1
    puts "#{i} matches the criteria"
  end

  i += 1
end

puts sum
puts count
