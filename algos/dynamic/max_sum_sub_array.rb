def max_sum_sub_array(array)
  max         = array[0]
  current_sum = [array[0]]

  (1..array.length - 1).each do |i|
    # which is bigger, the previous sum or adding the current one
    current_sum[i] = [array[i] + current_sum[i - 1], array[i]].max
    # current max
    max            = [current_sum[i], max].max
  end

  max
end

puts max_sum_sub_array([-2, -3, 4, -1, -2, 1, 5, -3])