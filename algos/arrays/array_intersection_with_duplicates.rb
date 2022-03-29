# Given two arrays, write a function to compute their intersection.
# Each element in the result should appear as many times as it shows in both arrays.
# The result can be in any order.

def array_intersection_with_duplicate(array_1, array_2)
  occurences_array_1 = {}
  occurences_array_2 = {}

  array_1.each do |item|
    if occurences_array_1.key?(item)
      occurences_array_1[item] += 1
    else
      occurences_array_1[item] = 1
    end
  end

  array_2.each do |item|
    if occurences_array_1.key?(item)
      if occurences_array_2.key?(item)
        occurences_array_2[item] += 1
      else
        occurences_array_2[item] = 1
      end
    end
  end

  res = []

  occurences_array_2.each do |key, value|
    appearance_in_both = [occurences_array_1[key], value].min
    appearance_in_both.times { res << key }
  end

  puts res.to_s
end

puts array_intersection_with_duplicate([1, 2, 3, 3, 4, 4, 4, 5, 8, 9, 7, 7, 7],
                        [2, 3, 3, 4, 4, 5, 6, 7, 7, 7])
