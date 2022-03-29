i = 0
res = []

while (i < chars.length)
  j = 0
  while j < chars.length && chars[i+j] == chars[i]
    j = j+1
  end
  res << chars[i]
  res << j
  i = i+j
end

puts res.join

