# Given two arrays, write a function to compute their intersection.
# Each element in the result must be unique.
# The result can be in any order.

def array_intersection(array_1, array_2)
  intersection = {}
  array_1.each do |item|
    intersection[item] = false
  end

  array_2.each do |item|
    intersection[item] = true if intersection.key?(item)
  end

  puts intersection.select { |_k, v| v }
end

puts array_intersection([1, 2, 3, 4, 9], [2, 3, 4, 5, 6])
